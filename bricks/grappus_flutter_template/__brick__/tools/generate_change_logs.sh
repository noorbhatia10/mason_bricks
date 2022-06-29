#!/usr/bin/env bash

# fail if any commands fails
set -e

# debug log
set -x

PLATFORM=$1

# reading the file content from changelogs.txt and storing the contents tll it matches first `####` pattern
CHANGELOG=$(sed -n '/####/q;p' ./changelogs.txt)

CHANGELOG_PREFIX="Daga Daga, New $PLATFORM build on it's way :airplane:, here are the change logs for the upcoming build :gift: "\

#this a method to convert text to json, where method parameters are used as $1
textToJson () {
    #using python to convert string to a valid json
 echo $(printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))')
}

# formatting the text captured from file to json
CHANGELOG_JSON=$(textToJson "$CHANGELOG_PREFIX $CHANGELOG")

echo "$CHANGELOG_JSON"

#sending the json payload to the required channel webhook stored in secrets
response=$(curl -X POST -H 'Content-type: application/json' --data '{"text":'"$CHANGELOG_JSON"'}' ${SUNSHINE_WEBHOOK})

echo "$response"

exit 0