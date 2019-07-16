#! /bin/bash

# https://github.com/gogo/protobuf/issues/325
 bin/simple-generator-linux-amd64 -d api/restlets.json -t scripts/tmpl/services.proto.tmpl > api/docs/service.proto
 bin/simple-generator-linux-amd64 -d api/types.json -t scripts/tmpl/message.proto.tmpl > api/docs/message.proto

