/*
 * Validators
 */
// ignore: avoid_classes_with_only_static_members
class ValidationUtils {
  static final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  static final RegExp digitsAndDotRegex = RegExp('[0-9.]');

  static bool isValidPhoneNumber(String number) {
    if (number.isEmpty || number.length != 10) {
      return false;
    } else {
      return true;
    }
  }

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }
}
