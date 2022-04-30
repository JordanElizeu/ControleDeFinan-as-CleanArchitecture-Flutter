import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';

import 'package:controle_financeiro/features/login/domain/entities/sign_in_firebase_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  @override
  Future<Either<Exception, RegisterAccountEntity>> registerAccount(
      {required RegisterAccountEntity registerAccountEntity}) {
    // TODO: implement registerAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, SignInFirebaseEntity>> signInFirebase(
      {required SignInFirebaseEntity signInEntity}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, void>> signInGoogle() {
    // TODO: implement signInGoogle
    throw UnimplementedError();
  }
}
