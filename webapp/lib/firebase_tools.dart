import 'package:firebase/firebase.dart' as firebase;
import 'package:firebase/firestore.dart' as firestore;

import 'firebase_constants.dart' as firebase_constants;
import 'authentication.dart' as auth;
import 'data_model.dart';
import 'logger.dart' as log;
import 'config.dart';
import 'sample_data/sample_json_datasets.dart';
import 'dart:async';

class DatasetLoadException implements Exception {
  final String _message;
  const DatasetLoadException(this._message);
  String toString() => _message;
}

typedef MessageUpdatesListener(List<Message> messages, ChangeType changeType);
enum ChangeType {
  added,
  modified
}

firestore.Firestore _firestoreInstance = firebase.firestore();

init() {
  if (TEST_MODE) return;

  firebase.initializeApp(
      apiKey: firebase_constants.apiKey,
      authDomain: firebase_constants.authDomain,
      databaseURL: firebase_constants.databaseURL,
      projectId: firebase_constants.projectId,
      storageBucket: firebase_constants.storageBucket,
      messagingSenderId: firebase_constants.messagingSenderId);
}

updateMessage(Dataset dataset, Message msg) {
  Stopwatch sw = new Stopwatch()..start();
  log.trace("updateMessage", "$msg");

  var docPath = "datasets/${dataset.id}/messages/${msg.id}";

  if (TEST_MODE) {
    log.logFirestoreCall('updateMessage', '$docPath', msg.toFirebaseMap());
    return;
  }

  _firestoreInstance.doc(docPath).set(msg.toFirebaseMap()).then((_) {
    log.trace("updateMessage", "Complete: ${msg.id}");
    log.perf("updateMessage", sw.elapsedMilliseconds);
    updateDatasetStatus(dataset);
  });
}

updateDatasetStatus(Dataset dataset) {
  Stopwatch sw = new Stopwatch()..start();
  log.trace("updateDatasetStatus", "${dataset.id}");

  int messagesCount = dataset.messages.length;
  int messagesWithLabel = dataset.messages.where((m) => m.labels.length > 0).length;

  var stats = {
    "messages_count" : messagesCount,
    "messages_with_label" : messagesWithLabel
  };

  var docPath = "datasets/${dataset.id}/metrics/Messages";

_firestoreInstance.doc(docPath).set(stats).then((_) {
    log.trace("updateDatasetStatus", "Complete: ${dataset.id}");
    log.perf("updateDatasetStatus", sw.elapsedMilliseconds);
  });
}

Future<List<Scheme>> loadSchemes(String datasetId) async {
  List<Scheme> ret = <Scheme>[];
  Stopwatch sw = new Stopwatch()..start();

  log.trace("loadSchemes", "Loading schemes for: $datasetId");

  var schemeCollectionRoot = "/datasets/$datasetId/code_schemes";
  log.trace("loadSchemes", "Root of query: $schemeCollectionRoot");

  var schemesQuery = await _firestoreInstance.collection(schemeCollectionRoot).get();
  log.trace("loadSchemes", "Query constructed");

  schemesQuery.forEach((scheme) {
    log.trace("loadSchemes", "Processing ${scheme.id}");

    ret.add(new Scheme.fromFirebaseMap(scheme.data()));
  });

  log.trace("loadSchemes", "${ret.length} schemes loaded in ${sw.elapsedMilliseconds}ms");
  log.perf("loadSchemes", sw.elapsedMilliseconds);
  return ret;
}

void setupListenerForFirebaseMessageUpdates(Dataset dataset, MessageUpdatesListener listener) {
  Stopwatch sw = new Stopwatch()..start();
  log.trace("setupListenerForFirebaseMessageUpdates", "Loading messages for: ${dataset.id}");

  var messagesCollectionRoot = "/datasets/${dataset.id}/messages";
  log.trace("setupListenerForFirebaseMessageUpdates", "Root of query: $messagesCollectionRoot");

  _firestoreInstance.collection(messagesCollectionRoot).onSnapshot.listen((querySnapshot) {
    // No need to process local writes to Firebase
    if (querySnapshot.metadata.hasPendingWrites) {
      log.trace("setupListenerForFirebaseMessageUpdates", "Skipping processing of local messages");
      return;
    }

    log.trace("setupListenerForFirebaseMessageUpdates", "Starting processing ${querySnapshot.docChanges().length} messages.");
    List<Message> added = [];
    List<Message> modified = [];
    querySnapshot.docChanges().forEach((documentChange) {
      Message message = new Message.fromFirebaseMap(documentChange.doc.data());
      if (documentChange.type == "added") {
        added.add(message);
      } else if (documentChange.type == "modified") {
        modified.add(message);
      } else {
        log.log("setupListenerForFirebaseMessageUpdates: Warning! Skip processing ${documentChange.type} message ${message.id}");
      }
    });
    log.trace("setupListenerForFirebaseMessageUpdates", "Finished processing ${querySnapshot.docChanges().length} messages in ${sw.elapsedMilliseconds}ms.");
    log.perf("DatasetLoad", sw.elapsedMilliseconds);

    listener(added, ChangeType.added);
    listener(modified, ChangeType.modified);
  });
}

Future<Dataset> loadDatasetWithOnlyCodeSchemes(String datasetId) async {
  log.verbose("Loading dataset: $datasetId");

  // TODO handle non-datasets for demo usage

  if (TEST_MODE) {
    log.logFirestoreCall('loadDataset', '$datasetId', jsonDatasetTwoSchemes);
    return new Dataset('two schemes', [], jsonDatasetTwoSchemes['CodeSchemes']);
  }

  List<Scheme> schemes = await loadSchemes(datasetId);

  return new Dataset(datasetId, [], schemes);
}

Future<List<String>> getDatasetIdsList() async {
  List<String> datasetIds = <String>[];
  Stopwatch sw = new Stopwatch()..start();

  log.trace("setupListenerForFirebaseMessageUpdates", "Loading dataset list");

  var datasetsCollectionRoot = "/datasets";
  log.trace("getDatasetIdsList", "Root of query: $datasetsCollectionRoot");

  var datasetsQuery = await _firestoreInstance
    .collection(datasetsCollectionRoot)
    .where("users", "array-contains", auth.getUserEmail())
    .get();
  log.trace("getDatasetIdsList", "Query constructed");

  datasetsQuery.forEach((dataset) {
    log.trace("getDatasetIdsList", "Processing ${dataset.id}");

    datasetIds.add(dataset.id);
  });

  log.trace("getDatasetIdsList", "${datasetIds.length} dataset ids collected in ${sw.elapsedMilliseconds}ms.");
  log.perf("getDatasetIdsList", sw.elapsedMilliseconds);

  return datasetIds;
}
