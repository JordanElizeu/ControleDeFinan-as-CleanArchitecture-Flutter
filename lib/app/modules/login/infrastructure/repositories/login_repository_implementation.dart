import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final SignInFirebaseDatasource _signInFirebaseDatasource;
  final SignInGoogleDataSource _signInGoogleDataSource;

  LoginRepositoryImplementation(
    this._signInFirebaseDatasource,
    this._signInGoogleDataSource,
  );

  @override
  Future<Either<Exception, RegisterAccountEntity>> registerAccount({
    required RegisterAccountEntity registerAccountEntity,
  }) async {
    return await _signInFirebaseDatasource.registerAccountFirebaseDataSource(
        registerAccountEntity: registerAccountEntity);
  }

  @override
  Future<Either<Exception, SignInFirebaseEntity>> signInFirebase({
    required SignInFirebaseEntity signInEntity,
  }) async {
    return await _signInFirebaseDatasource.signInFirebaseDataSource(
        signInEntity: signInEntity);
  }

  @override
  Future<Either<Exception, User>> signInGoogle() async {
    return await _signInGoogleDataSource.signInGoogle();
  }

  @override
  Future<Either<Exception, void>> forgotPasswordWithFirebase({
    required String email,
  }) async {
    return await _signInFirebaseDatasource.forgotPasswordWithFirebaseDatasource(
        email: email);
  }
}
