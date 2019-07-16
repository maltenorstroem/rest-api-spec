#!/usr/bin/env bash

# concats all restlets and type files
scripts/prepareapi.sh

# generate proto files
scripts/genproto_local.sh

# generate swagger docs
scripts/genswagger.sh

# update puml svg
scripts/gensvg.sh

# generate client environment
scripts/makeEnv.js

# generate java stubs
rm -rf shared-repo
./gradlew build publish