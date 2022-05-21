import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../infrastructure/datasources/google/sign_in_google_datasource.dart';

class SignInGoogleDataSourceImp implements SignInGoogleDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  SignInGoogleDataSourceImp(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<Exception, User>> signInGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return Right(userCredential.user!);
    } catch (exception) {
      return Left(Exception('Erro! Login falhou'));
    }
  }
}
