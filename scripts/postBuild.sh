#! /bin/bash

# Reads the version number from package.json and creates a git tag with this version.
# e.g. v1.0.0

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

echo "Current version is:" $PACKAGE_VERSION

#git tag -a v$PACKAGE_VERSION -m "Version $PACKAGE_VERSION"
#git push origin v$PACKAGE_VERSION
