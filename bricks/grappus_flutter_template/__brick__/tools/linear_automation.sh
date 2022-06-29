#!/usr/bin/env bash

# fail if any commands fails
set -e

# debug log
set -x

BRANCH_NAME=$1

IN_PROGRESS_WORKFLOW_ID="48e77582-522a-4ed0-9703-0011d9ef2cd0"
READY_FOR_QA_WORKFLOW_ID="3c2a8b17-0099-4a60-8f06-aa53247ff879"

WORKFLOW_ID=""

if [ $BRANCH_NAME = "develop" ]; then
  WORKFLOW_ID=$READY_FOR_QA_WORKFLOW_ID
else
  WORKFLOW_ID=$IN_PROGRESS_WORKFLOW_ID
fi

curl --location --request POST 'https://api.linear.app/graphql' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: lin_api_29vyAYv9FgfnFuQsMU04YBVnOJmElblGNG87Pv2t' \
  --data-raw '{"query":"mutation IssueUpdate {\n  issueUpdate(id: \"'$BRANCH_NAME'\", input: { sortOrder: -17721.07, stateId: \"'$WORKFLOW_ID'\" }) {\n    lastSyncId\n  }\n}","variables":{}}'
