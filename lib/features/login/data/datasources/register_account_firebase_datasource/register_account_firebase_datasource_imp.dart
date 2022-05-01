import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/core/exceptions/firebase_exception/firebase_create_user_with_email_and_password_exception.dart';
import 'package:controle_financeiro/features/login/data/datasources/register_account_firebase_datasource/register_account_firebase_datasource.dart';
import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterAccountFirebaseDataSourceImp
    implements RegisterAccountFirebaseDataSource {
  final FirebaseAuth _firebaseAuth;
  final collectionReference = FirebaseFirestore.instance.collection('Account');

  RegisterAccountFirebaseDataSourceImp(this._firebaseAuth);

  @override
  Future<Either<Exception, RegisterAccountEntity>> call(
      {required RegisterAccountEntity registerAccountEntity}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: registerAccountEntity.email,
          password: registerAccountEntity.password);
      await collectionReference
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

  Future<void> _saveInformationUserInFirebase(
    RegisterAccountEntity registerAccountEntity,
  ) async {
    await collectionReference
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('Authentication')
        .doc('UserInformation')
        .set({
      'email': registerAccountEntity.email,
      'name': registerAccountEntity.name,
    });
  }
}
