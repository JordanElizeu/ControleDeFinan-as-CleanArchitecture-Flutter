import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCreateUserWithEmailAndPasswordException{
  static String handleFirebaseCreateUserWithEmailAndPasswordException(
      {required FirebaseAuthException exceptionMessage}) {
    const _unknownError = "Erro desconhecido";
    const _informationEmailAlreadyInUse =
        "Já existe uma conta com o endereço de e-mail digitado.";
    const _informationInvalidEmail = "Endereço de e-mail não é válido.";
    const _informationOperationNotAllowed =
        "Erro no servidor! Entre em contato com o administrador para solução do problema.";
    const _informationWeakPassword = "Senha não é forte o suficiente.";

    switch (exceptionMessage.code) {
      case 'email-already-in-use':
        return _informationEmailAlreadyInUse;
      case 'invalid-email':
        return _informationInvalidEmail;
      case 'operation-not-allowed':
        return _informationOperationNotAllowed;
      case 'weak-password':
        return _informationWeakPassword;
      default:
        return _unknownError;
    }
  }
}