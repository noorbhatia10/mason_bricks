#!/bin/bash

# This script can be used to run flutter test for a given directory (defaults to the current directory)
# It will exclude generated code and translations (mimicking the ci) and open the coverage report in a
# new window once it has run successfully.
#
# To run in main project:
# .coverage.sh
#
# To run in other
# directory:
# .coverage.sh ./path/to/other/project

set -e

# debug log
set -x

PROJECT_PATH="${1:-.}"
PROJECT_COVERAGE=./coverage/lcov.info

bash tools/coverage_helper.sh "{{project_name}}"

echo "Present Working Directory is $PWD"

cd ${PROJECT_PATH}

rm -rf coverage
if grep -q "flutter:" pubspec.yaml; then
    flutter test --no-pub --test-randomize-ordering-seed random --coverage
else
    dart test --coverage=coverage && pub run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --packages=.packages --report-on=lib
fi
lcov --remove ${PROJECT_COVERAGE} -o ${PROJECT_COVERAGE} \
    '**/*.g.dart' \
    '**/l10n/*.dart' \
    '**/l10n/**/*.dart' \
    '**/view/*.dart' \
    '**/base/*.dart' \
    '**/main/bootstrap.dart' \
    '**/*.gen.dart'
