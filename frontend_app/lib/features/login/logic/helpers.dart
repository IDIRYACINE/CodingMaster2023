String? validateId(String? value) {
  if (value == null || value.isEmpty) {
    return 'Id cannot be empty';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }
  return null;
}
