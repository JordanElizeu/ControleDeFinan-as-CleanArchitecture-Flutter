import 'package:controle_financeiro/features/login/data/datasources/sign_in_google_datasource/sign_in_google_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogleDataSourceImp implements SignInGoogleDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  SignInGoogleDataSourceImp(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<Exception, bool>> call() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return const Right(true);
    } catch (exception) {
      return Left(Exception('Erro! Login falhou'));
    }
  }
}
