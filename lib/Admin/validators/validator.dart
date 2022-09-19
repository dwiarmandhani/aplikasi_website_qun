class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'TextField cannot be empty';
    }
    return null;
  }
}
