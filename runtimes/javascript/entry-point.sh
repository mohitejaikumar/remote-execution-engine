#!/bin/bash

cd /usr/share
git clone $TESTCASES_GIT

cd /javascript
cp /usr/share/testcases-ee/testcases/$PROBLEM_ID.json ./test_cases.json

response=$(curl -s "$CALLBACK_URL/submission/$SUBMISSION_ID")
main_func=$(echo "$response" | jq -r '.code')
echo "$main_func" > ./main_func.js

touch std_out.json

node run_tests.js