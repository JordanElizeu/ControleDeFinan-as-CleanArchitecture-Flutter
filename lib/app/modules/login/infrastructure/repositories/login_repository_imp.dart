import 'package:controle_financeiro/app/modules/login/infrastructure/datasources/google/sign_in_google_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/register_account_entity.dart';
import '../../domain/entities/sign_in_firebase_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/firebase/sign_in_firebase_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  final SignInFirebaseDatasource _signInFirebaseDatasource;
  final SignInGoogleDataSource _signInGoogleDataSource;

  LoginRepositoryImp(
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
