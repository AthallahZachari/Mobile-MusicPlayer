bool validateUsername(String username) {
  return username.length > 4 ;
      //&&
      //username.length <= 20 ;
      //&&
      //!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(username) &&
      //!RegExp(r'^[_]+$').hasMatch(username) &&
      //!RegExp(r'^[.]+$').hasMatch(username);
}

bool validatePassword(String password) {
  return password.length >= 5 &&
      RegExp(r'[a-z]').hasMatch(password) && //at least contains alphabet
      RegExp(r'[0-9]').hasMatch(password); //at least one number
}

bool isPasswordConfirmed(String password, String confirmPassword){
  return password == confirmPassword;
}

bool isValidated(String input, String type) {
  if (type == 'username') {
    return validateUsername(input); // Call the username validation function
  } else if (type == 'password') {
    return validatePassword(input); // Call the password validation function
  } else {
    throw ArgumentError('Invalid validation type: $type');
  }
}
