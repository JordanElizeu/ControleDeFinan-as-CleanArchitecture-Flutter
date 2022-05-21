import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSendPasswordResetEmailException {
  static String handleFirebaseSendPasswordResetEmailException(
      {required FirebaseAuthException exceptionMessage}) {
    const _unknownError = "Erro desconhecido";
    const _informationAuthOrEmailInvalid = "Endereço de e-mail inválido.";
    const _informationMissingAndroidPkgName =
        "Um nome do pacote Android deve ser fornecido se o aplicativo android for necessário para ser instalado.";
    const _informationUrlInvalid = "Url inválida ou inexistente.";
    const _informationMissingIosBundleId =
        "Erro no servidor! Entre em contato com o desenvolvedor para solução do problema.";
    const _informationUriContinueInvalid =
        "Url inválido na solicitação de uma nova senha.";
    const _informationUriContinueUnauthorized =
        "Acesse não autorizado! entre em contato com o desenvolvedor para mais detalhes.";
    const _informationUserNotFound =
        "não existe usuário correspondente ao endereço de e-mail digitado.";

    switch (exceptionMessage.code) {
      case 'auth/invalid-email':
        return _informationAuthOrEmailInvalid;
      case 'auth/missing-android-pkg-name':
        return _informationMissingAndroidPkgName;
      case 'auth/missing-continue-uri':
        return _informationUrlInvalid;
      case 'auth/missing-ios-bundle-id':
        return _informationMissingIosBundleId;
      case 'auth/invalid-continue-uri':
        return _informationUriContinueInvalid;
      case 'auth/unauthorized-continue-uri':
        return _informationUriContinueUnauthorized;
      case 'auth/user-not-found':
        return _informationUserNotFound;
      default:
        return _unknownError;
    }
  }
}
