To generate model classes via freezed

1. cd to this package i.e `api_controller`
2. Type `dart run build_runner build` or `dart run build_runner watch`
3. It will generate the classes for you

Note: If faced with conflicting outputs error try

``` dart
dart packages run build_runner build --delete-conflicting-outputs
```