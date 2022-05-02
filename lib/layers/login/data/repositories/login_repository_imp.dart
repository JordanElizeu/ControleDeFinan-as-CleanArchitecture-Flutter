import 'package:controle_financeiro/layers/login/data/datasources/firebase/forgot_password_with_firebase_datasource/forgot_password_with_firebase_datasource.dart';
import 'package:controle_financeiro/layers/login/data/datasources/firebase/register_account_firebase_datasource/register_account_firebase_datasource.dart';
import 'package:controle_financeiro/layers/login/data/datasources/firebase/sign_in_firebase_datasource/sign_in_firebase_datasource.dart';
import 'package:controle_financeiro/layers/login/data/datasources/google/sign_in_google_datasource/sign_in_google_datasource.dart';
import 'package:controle_financeiro/layers/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/layers/login/domain/entities/sign_in_firebase_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final RegisterAccountFirebaseDataSource _registerAccountFirebaseDataSource;
  final SignInFirebaseDataSource _signInFirebaseDataSource;
  final SignInGoogleDataSource _signInGoogleDataSource;
  final ForgotPasswordWithFirebaseDataSource
      _forgotPasswordWithFirebaseDataSource;

  LoginRepositoryImp(
    this._registerAccountFirebaseDataSource,
    this._signInFirebaseDataSource,
    this._signInGoogleDataSource,
    this._forgotPasswordWithFirebaseDataSource,
  );

  @override
  Future<Either<Exception, RegisterAccountEntity>> registerAccount(
      {required RegisterAccountEntity registerAccountEntity}) {
    return _registerAccountFirebaseDataSource.call(
        registerAccountEntity: registerAccountEntity);
  }

  @override
  Future<Either<Exception, SignInFirebaseEntity>> signInFirebase(
      {required SignInFirebaseEntity signInEntity}) {
    return _signInFirebaseDataSource.call(signInEntity: signInEntity);
  }

  @override
  Future<Either<Exception, bool>> signInGoogle() {
    return _signInGoogleDataSource.call();
  }

  @override
  Future<Either<Exception, bool>> forgotPasswordWithFirebase(
      {required String email}) {
    return _forgotPasswordWithFirebaseDataSource.call(email: email);
  }
}
