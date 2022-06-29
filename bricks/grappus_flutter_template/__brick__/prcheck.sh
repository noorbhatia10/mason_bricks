#!/bin/bash

#Made by nimish@grappus.com
# It is recommended to run this script before raising a PR.


# This script can be used to run flutter test for a given directory (defaults to the current directory)
# This will Perform the PR checks (mimicking the ci) and open the coverage report in a
# new window once it has run successfully.
#
# To run in main project:
# .coverage_check.sh
#
# To run in other directory:
# .coverage_check.sh ./path/to/other/project

set -e

# debug log
set -x

flutter format lib test packages

bash coverage.sh
