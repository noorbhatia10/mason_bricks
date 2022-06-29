#!/bin/sh

# fail if any commands fails
set -e

# debug log
set -x

#fetch a random dad joke.
dadJoke=$(curl -H "Accept: text/plain" https://icanhazdadjoke.com/)

#this a method to convert text to json, where method parameters are used as $1
textToJson () {
    #using python to convert string to a valid json
 echo $(printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))')
}

#sending the json payload to the required channel webhook stored in secrets
response=$(curl -X POST -H 'Content-type: application/json' --data '{"text":'"$(textToJson "$dadJoke")"'}' ${SUNSHINE_WEBHOOK})

echo "$response"