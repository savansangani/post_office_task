class FormValidators {
  /// Validator function for Sign up forms
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address'; // Validation error message
    }

    // Use a regular expression to check if the input matches the email format
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address'; // Invalid email format
    }

    // No validation error
    return null;
  }

  /// Password Validator
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password'; // Validation error message
    }

    // Check if the password meets the minimum length requirement
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check if the password contains at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check if the password contains at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check if the password contains at least one digit (number)
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check if the password contains at least one special character (e.g., !, @, #, $, %, etc.)
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    // No validation error
    return null;
  }

  static String? isNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required'; // Validation error message
    }

    // No validation error
    return null;
  }

  // required String? Function(String?)? validator,
  static String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required'; // Validation error message
    }

    // No validation error
    return null;
  }
}
