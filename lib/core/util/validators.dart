bool isEmailValid(String email) {
  // Email validation logic goes here
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"; // Regex pattern for email validation
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

bool isPasswordValid(String password) {
  // Password validation logic goes here
  return password.length >= 8 &&
      RegExp(r'(?=.*?[a-z])(?=.*?[A-Z])').hasMatch(password) &&
      RegExp(r'^[a-zA-Z\d!@#$%^&*_-]+$').hasMatch(password);
}
