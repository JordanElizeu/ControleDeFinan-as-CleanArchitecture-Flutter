import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/core/exceptions/firebase_exception/firebase_login_with_credentials_exception.dart';
import 'package:controle_financeiro/features/login/data/datasources/sign_in_firebase_datasource/sign_in_firebase_datasource.dart';
import 'package:controle_financeiro/features/login/domain/entities/sign_in_firebase_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInFirebaseDataSourceImp implements SignInFirebaseDataSource {
  final FirebaseAuth _firebaseAuth;
  SignInFirebaseDataSourceImp(this._firebaseAuth);

  @override
  Future<Either<Exception, SignInFirebaseEntity>> call(
      {required SignInFirebaseEntity signInEntity}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: signInEntity.email, password: signInEntity.password);
      return Right(signInEntity);
    } on FirebaseAuthException catch (exception) {
      return Left(Exception(FirebaseLoginWithCredentialsException
          .handleFirebaseLoginWithCredentialsException(
        exceptionMessage: exception,
      )));
    }
  }
}
