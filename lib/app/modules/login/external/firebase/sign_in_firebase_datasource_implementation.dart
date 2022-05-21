import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/app/modules/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/app/modules/login/domain/entities/sign_in_firebase_entity.dart';
import 'package:controle_financeiro/app/modules/login/infrastructure/exceptions/firebase_create_user_with_email_and_password_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../infrastructure/exceptions/firebase_login_with_credentials_exception.dart';
import '../../infrastructure/datasources/firebase/sign_in_firebase_datasource.dart';
import '../../infrastructure/exceptions/firebase_send_password_reset_email_exception.dart';

class SignInFirebaseDatasourceImplementation
    implements SignInFirebaseDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  SignInFirebaseDatasourceImplementation(
      this._firebaseAuth, this._firebaseFirestore);

  Future<void> _saveInformationUserInFirebase(
    RegisterAccountEntity registerAccountEntity,
  ) async {
    await _firebaseFirestore
        .collection('Account')
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('Authentication')
        .doc('UserInformation')
        .set({
      'email': registerAccountEntity.email,
      'name': registerAccountEntity.name,
    });
  }

  @override
  Future<Either<Exception, void>> forgotPasswordWithFirebaseDatasource(
      {required String email}) async {
    try {
      return Right(await _firebaseAuth.sendPasswordResetEmail(email: email));
    } on FirebaseAuthException catch (exception) {
      return Left(Exception(FirebaseSendPasswordResetEmailException
          .handleFirebaseSendPasswordResetEmailException(
        exceptionMessage: exception,
      )));
    }
  }

  @override
  Future<Either<Exception, RegisterAccountEntity>>
      registerAccountFirebaseDataSource(
          {required RegisterAccountEntity registerAccountEntity}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: registerAccountEntity.email,
          password: registerAccountEntity.password);
      await _firebaseFirestore
          .collection('Account')
          .doc(_firebaseAuth.currentUser?.uid)
          .collection('Authentication')
          .doc('FirebaseAuthentication')
          .collection('MyAccount')
          .add({
        'email': registerAccountEntity.email,
      });
      await _saveInformationUserInFirebase(registerAccountEntity);
      return Right(registerAccountEntity);
    } on FirebaseAuthException catch (exception) {
      return Left(Exception(FirebaseCreateUserWithEmailAndPasswordException
          .handleFirebaseCreateUserWithEmailAndPasswordException(
        exceptionMessage: exception,
      )));
    }
  }

  @override
  Future<Either<Exception, SignInFirebaseEntity>> signInFirebaseDataSource(
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
