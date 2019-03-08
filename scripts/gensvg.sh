#!/usr/bin/env bash

# generates puml graph
java -jar docs/plantuml.jar docs/api.puml -tsvg

# concats all restlets and type files
scripts/prepareapi.sh

