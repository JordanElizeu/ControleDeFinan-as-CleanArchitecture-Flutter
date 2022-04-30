import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginWithCredentialsException {
  static String handleFirebaseLoginWithCredentialsException(
      {required FirebaseAuthException exceptionMessage}) {
    const _informationUserDisabled = "O usuário informado está desabilitado.";
    const _informationUserNotFound = "O usuário informado não está cadastrado.";
    const _unknownError = "Erro desconhecido";
    const _informationInvalidEmail =
        "O domínio do e-mail informado é inválido.";
    const _informationWrongPassword = "A senha informada está incorreta.";

    switch (exceptionMessage.code) {
      case 'user-disabled':
        return _informationUserDisabled;
      case 'user-not-found':
        return _informationUserNotFound;
      case 'invalid-email':
        return _informationInvalidEmail;
      case 'wrong-password':
        return _informationWrongPassword;
      default:
        return _unknownError;
    }
  }
}
