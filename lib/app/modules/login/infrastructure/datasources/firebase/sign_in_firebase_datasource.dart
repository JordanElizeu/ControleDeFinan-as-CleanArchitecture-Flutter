import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';

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
