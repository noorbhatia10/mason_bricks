//get string value of an enum

extension EnumX on Object {
  String asString() => toString().split('.').last;
}
