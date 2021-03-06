#!/usr/bin/env bash

# Setting package version to gradle.properties
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

echo "Current version is:" $PACKAGE_VERSION
echo "apiSpecVersion:$PACKAGE_VERSION" > 'gradle.properties'

echo "generating restlets and types from api specification ..."
echo "*** Prepare ***"

rm api/types.json
# open Array
echo '{"types":[' >> api/types.json

for t in api/types/*.spec; do (cat $t; echo ',') >> api/tmptypes.json; done

cat api/tmptypes.json | sed '$ s/.$//' >> api/types.json
rm api/tmptypes.json
# close Array
echo ']}' >> api/types.json

echo "types done."

rm api/restlets.json
# open Array
echo '{"restlets":[' >> api/restlets.json

for t in api/restlets/*.spec; do (cat $t; echo ',') >> api/tmprestlets.json; done

cat api/tmprestlets.json | sed '$ s/.$//' >> api/restlets.json
rm api/tmprestlets.json
# close Array
echo ']}' >> api/restlets.json

echo "restlets done."

echo "*** preparing done! ***"