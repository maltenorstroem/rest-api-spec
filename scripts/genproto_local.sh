#! /bin/bash

# https://github.com/gogo/protobuf/issues/325
 simple-generator -d api/restlets.json -t scripts/tmpl/services.proto.tmpl > api/docs/service.proto
 simple-generator -d api/types.json -t scripts/tmpl/message.proto.tmpl > api/docs/message.proto

