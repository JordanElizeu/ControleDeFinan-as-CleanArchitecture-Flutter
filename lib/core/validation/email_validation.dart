class EmailValidation {
  static bool validateEmail(String email) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\'
        r']\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9'
        r']{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9'
        r']{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-'
        r'Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
}
