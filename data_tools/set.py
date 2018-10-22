import firebase_client_wrapper as fcw

import json
import sys

import validate_code_scheme
import validate_message_structure
import validate_user_list

if (len(sys.argv) != 5):
    print ("Usage python set.py crypto_token dataset_id users|schemes|messages path")

    exit(1)

CRYPTO_TOKEN_PATH = sys.argv[1]
fcw.init_client(CRYPTO_TOKEN_PATH)

DATASET_ID = sys.argv[2]
CONTENT_TYPE = sys.argv[3]
PATH = sys.argv[4]

dataset_ids = fcw.get_dataset_ids()

if DATASET_ID not in dataset_ids:
    print ("WARNING: dataset {} does not exist, this will create a new dataset".format(DATASET_ID))


if CONTENT_TYPE not in ["users", "schemes", "messages"]:
    print ("update target {} not known".format(TARGET))
    exit(1)


json_data = json.loads(open(PATH, 'r').read())
dataset_ref = fcw.get_dataset_ref(DATASET_ID)

if CONTENT_TYPE == "users":
    validate_user_list.verify_JSON_path(PATH)
    users_list = json_data
    print ("Setting users for '{}': {}".format(DATASET_ID, users_list))
    dataset_ref.set({
        'users': users_list
    })
    print ("Done")
elif CONTENT_TYPE == "schemes":
    for scheme in json_data:
        validate_code_scheme.verify_scheme(scheme)
        id = scheme["SchemeID"]
        code_scheme_ref = fcw.get_code_scheme_ref(DATASET_ID, id).set(scheme)
        print ("Updated: {}".format(id))
elif CONTENT_TYPE == "messages":
    for message in json_data:
        validate_message_structure.verify_message(message)
        id = message["MessageID"]
        message_ref = fcw.get_message_ref(DATASET_ID, id).set(message)
        print ("Updated: {}".format(id))

        # id = scheme["SchemeID"]
        # code_scheme_ref = fcw.get_code_scheme_ref(DATASET_ID, id).set(scheme)
        # print ("Updated: {}".format(id))



# elif CONTENT_TYPE == "messages":





# if (len(sys.argv) == 4):
#     CONTENT_TYPE = sys.argv[3].lower()

# ALL = CONTENT_TYPE == "all"

# if CONTENT_TYPE in ["all", "users"]:
#     if ALL: 
#         print ("Users:")
#     print (json.dumps(fcw.get_user_ids(DATASET_ID), indent=2))

# if CONTENT_TYPE in ["all", "schemes"]:
#     if ALL:
#         print ("Schemes:")
#     schemes_map = {}
#     for scheme in fcw.get_code_scheme_ids(DATASET_ID):
#         schemes_map[scheme] = fcw.get_code_scheme(DATASET_ID, scheme)
#     print (json.dumps(schemes_map, indent=2))

# if CONTENT_TYPE in ["all", "messages"]:
#     if ALL:
#         print ("Messages:")
#     messages_map = {}
#     for message in fcw.get_all_messages(DATASET_ID):
#         messages_map[message["MessageID"]] = message
#     print (json.dumps(messages_map, indent=2))
