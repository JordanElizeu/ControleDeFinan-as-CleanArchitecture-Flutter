import 'package:dartz/dartz.dart';
import '../entities/register_account_entity.dart';
import '../entities/sign_in_firebase_entity.dart';

abstract class LoginRepository {
  Future<Either<Exception, SignInFirebaseEntity>> signInFirebase({
    required SignInFirebaseEntity signInEntity,
  });

  Future<Either<Exception, RegisterAccountEntity>> registerAccount({
    required RegisterAccountEntity registerAccountEntity,
  });

  Future<Either<Exception, void>> signInGoogle();
}
