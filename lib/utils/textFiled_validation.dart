class TextFieldValidation {
  TextFieldValidation._();
  static String? validation({
    String? value,
    String? message,
    bool isEmailValidator = false,
    bool isPasswordValidator = false,
    bool isNumberValidator = false,
  }) {
    if (value == null || value.length == 0) {
      return "$message is Required !";
    } else if (isEmailValidator == true) {
      if (value.isEmpty) {
        return "$message is Required !";
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return 'Enter Valid $message';
      }
    } else if (isPasswordValidator == true) {
      if (value.isEmpty) {
        return "$message is Required !";
      } else if (!RegExp(
              r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
          .hasMatch(value)) {
        if (value.length < 8) {
          return 'Password must have at least 8 numeric digits';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password should contain numeric only';
        } else
          return null;
      }
    } else if (isNumberValidator == true) {
      if (value.length != 10) return 'Mobile Number must be of 10 digit';
    }
    return null;
  }
}
