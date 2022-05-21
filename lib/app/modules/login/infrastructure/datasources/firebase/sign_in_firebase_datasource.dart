import 'package:dartz/dartz.dart';

import '../../../domain/entities/register_account_entity.dart';
import '../../../domain/entities/sign_in_firebase_entity.dart';

abstract class SignInFirebaseDatasource {
  Future<Either<Exception, void>> forgotPasswordWithFirebaseDatasource(
      {required String email});
  Future<Either<Exception, RegisterAccountEntity>>
      registerAccountFirebaseDataSource({
    required RegisterAccountEntity registerAccountEntity,
  });
  Future<Either<Exception, SignInFirebaseEntity>> signInFirebaseDataSource({
    required SignInFirebaseEntity signInEntity,
  });
}
