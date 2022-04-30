import 'package:controle_financeiro/features/login/data/datasources/register_account_firebase_datasource/register_account_firebase_datasource.dart';
import 'package:controle_financeiro/features/login/data/datasources/sign_in_firebase_datasource/sign_in_firebase_datasource.dart';
import 'package:controle_financeiro/features/login/data/datasources/sign_in_google_datasource/sign_in_google_datasource.dart';
import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/features/login/domain/entities/sign_in_firebase_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final RegisterAccountFirebaseDataSource _registerAccountFirebaseDataSource;
  final SignInFirebaseDataSource _signInFirebaseDataSource;
  final SignInGoogleDataSource _signInGoogleDataSource;

  LoginRepositoryImp(
    this._registerAccountFirebaseDataSource,
    this._signInFirebaseDataSource,
    this._signInGoogleDataSource,
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
  Future<Either<Exception, void>> signInGoogle() {
    return _signInGoogleDataSource.call();
  }
}
