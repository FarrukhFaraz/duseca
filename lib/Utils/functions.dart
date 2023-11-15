import 'package:email_validator/email_validator.dart';

class AppFunctions {
  bool emailValidator(String email) {
    final bool isValid = EmailValidator.validate(email);
    return isValid;
  }

  bool isPasswordValid(String password) {
    RegExp pattern =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[^A-Za-z0-9]).{8,}$');

    return pattern.hasMatch(password);
  }
}
