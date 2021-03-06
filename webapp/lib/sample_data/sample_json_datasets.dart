library coda.test.data;

Map jsonDatasetNoSchemes = {
  "messages": [
    {
      "MessageID": "msg 0",
      "SequenceNumber": 0,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
  ],
  "code_schemes": []
};


Map jsonDatasetOneScheme = {
  "messages": [
    {
      "MessageID": "msg 0",
      "SequenceNumber": 0,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 1",
      "SequenceNumber": 1,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 1",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 1",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    },
    {
      "MessageID": "msg 2",
      "SequenceNumber": 2,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 1",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 11",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    },
    {
      "MessageID": "msg 3",
      "SequenceNumber": 3,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 1",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 1",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        },
        {
          "SchemeID": "scheme 1",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 2",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    }
  ],
  "code_schemes": [
    {
      "SchemeID": "scheme 1",
      "Name": "Scheme 1",
      "Version": "0.0.0.1",
      "Codes": [
        {
          "DisplayText": "code 1",
          "CodeID": "code 1",
          "NumericValue": 20,
          "Color": "#f46241",
          "Shortcut": "1",
          "VisibleInCoda": true
        },
        {
          "DisplayText": "code 2",
          "CodeID": "code 2",
          "NumericValue": 30,
          "Shortcut": "2",
          "VisibleInCoda": true
        }
      ]
    },
  ]
};


Map jsonDatasetTwoSchemes = {
  "messages": [
    {
      "MessageID": "msg 0",
      "SequenceNumber": 0,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 1",
      "SequenceNumber": 1,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 1",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 1",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    },
    {
      "MessageID": "msg 2",
      "SequenceNumber": 2,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 2",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 2",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    },
    {
      "MessageID": "msg 3",
      "SequenceNumber": 3,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 1",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 1",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        },
        {
          "SchemeID": "scheme 2",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 2",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    },
    {
      "MessageID": "msg 4",
      "SequenceNumber": 4,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 2",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 1",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        },
        {
          "SchemeID": "scheme 2",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 2",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        }
      ]
    },
    {
      "MessageID": "msg 5",
      "SequenceNumber": 5,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": [
        {
          "SchemeID": "scheme 2",
          "DateTimeUTC": "2018-09-23T14:14:00Z",
          "CodeID": "code 22",
          "Origin": {
            "OriginID": "info@example.com",
            "Name": "Example Coder",
            "OriginType": "Manual"
          }
        },
      ]
    },
  ],
  "code_schemes": [
    {
      "SchemeID": "scheme 1",
      "Name": "Scheme 1",
      "Version": "0.0.0.1",
      "Codes": [
        {
          "DisplayText": "code 1",
          "CodeID": "code 1",
          "NumericValue": 20,
          "Color": "#f46241",
          "Shortcut": "1",
          "VisibleInCoda": true
        },
        {
          "DisplayText": "code 2",
          "CodeID": "code 2",
          "NumericValue": 30,
          "Shortcut": "2",
          "VisibleInCoda": true
        }
      ]
    },
    {
      "SchemeID": "scheme 2",
      "Name": "Scheme 2",
      "Version": "0.0.0.1",
      "Codes": [
        {
          "DisplayText": "code 1",
          "CodeID": "code 1",
          "NumericValue": 10,
          "Color": "#f46241",
          "Shortcut": "a",
          "VisibleInCoda": true
        },
        {
          "DisplayText": "code 2",
          "CodeID": "code 2",
          "NumericValue": 20,
          "Shortcut": "b",
          "VisibleInCoda": true
        }
      ]
    }
  ]
};

Map jsonDatasetTwoSchemesNoCodes = {
  "messages": [
    {
      "MessageID": "msg 0",
      "SequenceNumber": 0,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 1",
      "SequenceNumber": 1,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 2",
      "SequenceNumber": 2,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 3",
      "SequenceNumber": 3,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 4",
      "SequenceNumber": 4,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
    {
      "MessageID": "msg 5",
      "SequenceNumber": 5,
      "Text": "message",
      "CreationDateTimeUTC": "2018-09-23T14:14:00Z",
      "Labels": []
    },
  ],
  "code_schemes": [
    {
      "SchemeID": "scheme 1",
      "Name": "Scheme 1",
      "Version": "0.0.0.1",
      "Codes": [
        {
          "DisplayText": "code 1",
          "CodeID": "code 1",
          "NumericValue": 20,
          "Color": "#f46241",
          "Shortcut": "1",
          "VisibleInCoda": true
        },
        {
          "DisplayText": "code 2",
          "CodeID": "code 2",
          "NumericValue": 30,
          "Shortcut": "2",
          "VisibleInCoda": true
        }
      ]
    },
    {
      "SchemeID": "scheme 2",
      "Name": "Scheme 2",
      "Version": "0.0.0.1",
      "Codes": [
        {
          "DisplayText": "code 1",
          "CodeID": "code 1",
          "NumericValue": 10,
          "Color": "#f46241",
          "Shortcut": "a",
          "VisibleInCoda": true
        },
        {
          "DisplayText": "code 2",
          "CodeID": "code 2",
          "NumericValue": 20,
          "Shortcut": "b",
          "VisibleInCoda": true
        }
      ]
    }
  ]
};
