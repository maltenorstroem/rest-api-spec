# API Specification

## Reserved words
DO NOT USE THE FOLLOWING WORDS IN RESTLETS OR TYPES:

* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
* value 


the specification consists of two parts:

* restlets
* types

## Restlets
Definition of specific services

```
{
  "general": {
    "name": "vertraege",
    "description": "Repräsentiert einen Vertrag komposit",
    "version": "1.0.0",
    "lifecycle": {
      "deprecated": false,
      "info": "This version is still valid"
    }
  },
  "services": {
    "Create": {
      "description": "creates a new contract composite",
      "data": {
        "request": "vnd.com.adcubum.contractmgmt.vertrag",
        "response": "vnd.com.adcubum.contractmgmt.vertrag"
      },
      "query": {},
      "deeplink": {
        "rel": "create",
        "method": "POST",
        "href": "/api/v1/vertraege"
      },
      "caching": {
        "no-cache": false,
        "private": true,
        "max-age": 10,
        "Expires": 10,
        "ETag": true
      }
    },
    "List": {
      "description": "The List method takes a collection name and zero or more parameters as input, and returns a list of resources (response type definition) that match the input.",
      "data": {
        "request": null,
        "response": "vnd.com.adcubum.contractmgmt.vertrag"
      },
      "query": {
        "opt": {
            "description": "Option des Vertrages",
            "value": "",
            "type": "string"
        }
      },
      "deeplink": {
        "rel": "list",
        "method": "GET",
        "href": "/api/v1/vertraege"
      },
      "options": {
        "filter": {
          "enabled": true,
          "fields": [
            "vertragNummer",
            "zustand"
          ]
        },
        "order_by": {
          "enabled": true,
          "fields": [
            "vertragNummer",
            "zustand"
          ]
        },
        "pagination": {
          "enabled": true,
          "default": 19,
          "max": 42
        }
      },
      "caching": {
        "no-cache": false,
        "private": true,
        "max-age": 10,
        "Expires": 10,
        "ETag": true
      }
    },
    "Get": {
      "description": "The Get method takes a resource name, zero or more parameters, and returns the specified resource (response type definition).",
      "data": {
        "request": null,
        "response": "vnd.com.adcubum.contractmgmt.vertrag"
      },
      "query": {},
      "deeplink": {
        "rel": "self",
        "method": "GET",
        "href": "/api/v1/vertraege/{vtr}"
      },
      "caching": {
        "no-cache": false,
        "private": true,
        "max-age": 10,
        "Expires": 10,
        "ETag": true
      }
    },
    "Release": {
      "description": "Releases the pending contract",
      "data": {
        "request": null,
        "response": "vnd.com.adcubum.contractmgmt.vertrag"
      },
      "query": {},
      "deeplink": {
        "rel": "self",
        "method": "POST",
        "href": "/api/v1/vertraege/{vtr}:release"
      },
      "caching": {
        "no-cache": false,
        "private": true,
        "max-age": 10,
        "Expires": 10,
        "ETag": true
      }
    }
  }
}

```

## Types
Definition of messagetypes.

```

{
  "name": "myTypeDefinition",
  "type": "vnd.com.adcubum.*",
  "mime": "application/vnd.com.adcubum.*+json",
  "description": "",
  "fields": {
    "fieldname": {
        "description": "String representation of this type",
        "type": "string, int, number, double, float, date, datetime, time, bool, vnd.com.adcubum.*",
        "meta": {
            "label": "Display"
            "default": {"date": "2019-12-12", "time": "11:44"}
            "hint": "",
            "readonly": true
        },
        "constraints": {
            "any": {"value": "make sure that the constraints are implemented in a validator"}
        },
        "options": [],
        "toString": {
            "fields": [
                "sub field from vnd.com.adcubum...",
                "sub field from vnd.com.adcubum..."
            ],
            "template": "{field1} : {field2}",
            "fmt": "%1 - %2"
        }
    },
    ...
  ]
}

```
## Request structure

### Request body

```
{
    "name": "Mo",
    "istPreis": {"currencyCode": "CHF", "units": 452, "nanos": 50},
    ...
}

```
> PUT: All values are transmitted. \
> PATCH: Only changed values are transmitted.


### Query Strings
A query string is the part of a uniform resource locator (URL) which assigns values to specified parameters.
The parameters are declared in the service definition.

```
"query": {
    "opt": {
        "description": "Option des Vertrages",
        "value": "",
        "type": "string"
    }
},
```

```
?opt=???
```

All Services should implement partial representation (for collections it is recommended):

```
 ?fields=name,username
```

### Pagination, result ordering and filtering

All List Services should implement
* pagination
* result ordering
* filtering

```
"options": {
    "filter": {
        "enabled": true,
        "fields": [
            "vertragNummer",
            "zustand"
        ]
    },
    "order_by": {
        "enabled": true,
        "fields": [
            "vertragNummer",
            "zustand"
        ]
    },
    "pagination": {
        "enabled": true,
        "default": 19,
        "max": 42
    }
},
```

#### result filtering

Possible filter operators:


| Operator          | Meaning                            |
|:----------------- |:---------------------------------- |
| lt  oder <        | lower than |
| lte oder <=       | lower than or equal |
| gt  oder >        | greater than |
| gte oder >=       | greater than or equal |
| eq  oder =        | equal |
|  **more operators**     ||
| in                | in |
| btw               | between |
| btwe              | between but including the values  |
| is null           | is null, true,false |
| sw                | starts with |
| ew                | ends with |
| con               | contains |
| **negations**     ||
| !eq               | not equal |
| !btw              | outside, not between |
| !null             | not null |
| !con              | does not contain |
| !sw               | does not starts with |
| !ew               | does not ends with |
| !in               | not in |

```
?filter=[["vertragsnummer","sw", "MF-"]]
```

#### result ordering
The string value should follow SQL syntax: comma separated list of fields.
E.g.: "foo,bar". The default sorting order is ascending. To specify descending order
for a field, a suffix " desc" should be appended to the field name. For example: "foo desc,bar".

```
?orderBy=foo,bar desc
```

#### pagination
For pagination support the following hateoas links should be created (only if available):

* rel="first"
* rel="last"
* rel="prev"
* rel="next"

```
?page=1
```


## Response structure

### fundamental JSON response structure

> Entity
```
{
    data: {},
    meta: {}, //optional
    links: []
}
``` 

> Collection
```
{
    data: [
        {
            data: {},
            meta: {}, //optional
            links: []
        },
        {
            data: {},
            meta: {}, //optional
            links: []
        }
    ],
    meta: {}, //optional
    links: []
}
``` 

### data part

```
"data": {
    "id": "00003215",
    "name": "Mo",
    "istPreis": {"currencyCode": "CHF", "units": 452, "nanos": 50},
    ...
}

```


### meta part (optional)

```
"meta": {
    "fields": {
        "id": {
            "meta": {
              "label": "Partnernr.",
              "default": {"display_name":  "", "id":  "", "rel": "List", "href":  "/api/v1/partner", "method":  "GET", "type":  "vnd.adcubum.xxx.partner"},
              "readonly": true,
              "repeated": true
            },
            "constraints": {
              "min": {
                "value": 5,
                "message": "Fuenf Zeichen sind zwingend"
              },
              "max": {
                "value": 14,
                "message": "Vierzehn sind genug"
              }
            },
            "options": []
        },
        "customType": {
                "meta": {
                  "label": "Lohnsccs"
                },
                "constraints": {
                  "min": {
                    "value": 5,
                    "message": "Fuenf Zeichen sind zwingend"
                  },
                  "max": {
                    "value": 14,
                    "message": "Vierzehn sind genug"
                  }
                },
                "options": [
                    {Object of field type},
                    ...
                ]
             }
          }
        },
        ...
    }
}
```

### error part

[API Design Guide: Errors](https://cloud.google.com/apis/design/errors)

```
{
  "error": "invalid username",
  "message": "invalid username",
  "code": 3,
  "details": [
    {
      "@type": "e.g. type.googleapis.com/google.rpc.BadRequest",
      "field_violations": [
        {
          "field": "username",
          "description": "The username must only contain alphanumeric characters"
        }
      ]
    }
  ]
}
```

#### error implementation with grpc gateway

[The error tracing is implemented with the message types of Google.](https://github.com/googleapis/googleapis/blob/master/google/rpc/status.proto)

> The corresponding message types must be imported in the gRPC gateway.

e.g.
* A message type used to describe a single bad request field.
* Protobuf type: {@code google.rpc.BadRequest.FieldViolation}

```
responseObserver.onError(StatusUtils.invalidArgumentError("test", "ErrorMessage"));

...

static com.google.rpc.Status invalidArgumentStatus(String field, String desc) {
    FieldViolation v = FieldViolation.newBuilder().setField(field).setDescription(desc).build();
    return Status.newBuilder()
        .setCode(Code.INVALID_ARGUMENT.getNumber())
        .setMessage("invalid argument(s): " + field + ": " + desc)
        .addDetails(Any.pack(BadRequest.newBuilder().addFieldViolations(v).build()))
        .build();
}
```

### links part

```
"links": [
 {"rel": "self", method": "GET", "href": "/xxxxx", "type": "application/vnd.xxx.xxx.xxxx"},
 {"rel": "create", method": "POST", "href": "/xxxxx", "type": "application/vnd.xxx.xxx.xxxx"},
 ...
]
```
