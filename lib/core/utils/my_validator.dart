

class MyValidators {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'This Email is not valid';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~£]).{8,}$';
    RegExp regEx = RegExp(pattern);
    if (!regEx.hasMatch(value!)) {
      return "Password is Not valid";
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please enter your mobile number";
    } else if (value.trim().length < 11 || value.trim().length > 11) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? confirmationPassValidator(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return "please enter Confirmation password";
    }
    if (value != password) {
      return 'password not matched';
    }
    return null;
  }

  static String? signupPasswordValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please enter your password";
    }
    if (value.trim().length < 6 || value.trim().length > 30) {
      return "Please enter a minimum of 6 char";
    }
    return null;
  }
}
