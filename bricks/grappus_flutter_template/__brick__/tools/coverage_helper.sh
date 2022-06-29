#!/bin/sh

#workaround for https://github.com/flutter/flutter/issues/27997
# by nimish@grappus.com
# usage
# bash coverage_helper.sh $package_name
# eg: bash coverage_helper.sh "{{project_name}}"

set -e

# debug log
set -x

echo "Present Working Directory is $PWD"

file=test/app/view/app_test.dart
echo "// Helper file to make coverage work for all dart files\n" > $file
echo "// ignore_for_file: unused_import" >> $file
echo "// ignore_for_file: avoid_relative_lib_imports" >> $file
echo $'// ignore_for_file: directives_ordering\n' >> $file
find lib -wholename "**/views/*.dart" ! -iname "*_state.dart" ! -iname "*_event.dart" ! -wholename "**/view/*.dart" | cut -c4- | awk -v package=$1 '{printf "import '\''package:%s%s'\'';\n", package, $1}' >> $file
echo $'\nvoid main(){}' >> $file
