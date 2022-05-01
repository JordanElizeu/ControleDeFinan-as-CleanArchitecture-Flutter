import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/features/login/data/datasources/sign_in_google_datasource/sign_in_google_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/exceptions/firebase_exception/firebase_create_user_with_email_and_password_exception.dart';

class SignInGoogleDataSourceImp implements SignInGoogleDataSource {
  final collectionReference = FirebaseFirestore.instance.collection('Account');
  final FirebaseAuth _firebaseAuth;

  SignInGoogleDataSourceImp(this._firebaseAuth);

  @override
  Future<Either<Exception, void>> call() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return await _saveUserInFirebaseWhenSignInGoogleIsSuccess();
    } catch (exception) {
      return Left(Exception('Erro! Login falhou'));
    }
  }

  Future<Either<Exception, void>>
      _saveUserInFirebaseWhenSignInGoogleIsSuccess() async {
    try {
      await collectionReference
          .doc(_firebaseAuth.currentUser?.uid)
          .collection('Authentication')
          .doc('FirebaseAuthentication')
          .collection('MyAccount')
          .add({
        'email': _firebaseAuth.currentUser?.email,
      });
      return const Right(null);
    } on FirebaseAuthException catch (exception) {
      return Left(Exception(FirebaseCreateUserWithEmailAndPasswordException
          .handleFirebaseCreateUserWithEmailAndPasswordException(
        exceptionMessage: exception,
      )));
    }
  }
}
