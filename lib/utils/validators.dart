class Validators {
  // Email must end with @vit.edu
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.endsWith('@vit.edu')) {
      return 'Email must be a valid @vit.edu address';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@vit\.edu$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // PRN must be exactly 10 digits
  static String? validatePRN(String? value) {
    if (value == null || value.isEmpty) {
      return 'PRN is required';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'PRN must be exactly 10 digits';
    }
    return null;
  }

  // Phone must be exactly 10 digits
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Phone must be exactly 10 digits';
    }
    return null;
  }

  // Generic required field
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Name must be at least 2 characters
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }
}