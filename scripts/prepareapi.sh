#!/usr/bin/env bash

echo "generating restlets and types from api specification ..."
echo "*** Prepare ***"

rm api/types.json
# open Array
echo '[' >> api/types.json

for t in api/types/*.type.*; do (cat $t; echo ',') >> api/tmptypes.json; done

cat api/tmptypes.json | sed '$ s/.$//' >> api/types.json
rm api/tmptypes.json
# close Array
echo ']' >> api/types.json

echo "types done."

rm api/restlets.json
# open Array
echo '[' >> api/restlets.json

for t in api/restlets/*.*; do (cat $t; echo ',') >> api/tmprestlets.json; done

cat api/tmprestlets.json | sed '$ s/.$//' >> api/restlets.json
rm api/tmprestlets.json
# close Array
echo ']' >> api/restlets.json

echo "restlets done."

echo "*** preparing done! ***"