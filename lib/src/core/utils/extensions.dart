extension ExtString on String {
  bool get isValidUsernameOrEmail {
    // Regular expression for a valid email address
    String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

    // Regular expression for a valid username (allowing letters, numbers, underscores, and dashes)
    String usernameRegex = r'^[a-zA-Z0-9_-]+$';

    // Check if the input is a valid email or username
    return RegExp(emailRegex).hasMatch(this) ||
        RegExp(usernameRegex).hasMatch(this);
  }

  bool get isValidPassword {
    // Check if the password is at least 8 characters long
    if (trim().length < 8) {
      return false;
    }

    // Check if the password contains at least one uppercase letter
    if (!contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Check if the password contains at least one lowercase letter
    if (!contains(RegExp(r'[a-z]'))) {
      return false;
    }

    // Check if the password contains at least one digit
    if (!contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Check if the password contains at least one special character
    if (!contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    // If all criteria are met, the password is considered valid
    return true;
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
