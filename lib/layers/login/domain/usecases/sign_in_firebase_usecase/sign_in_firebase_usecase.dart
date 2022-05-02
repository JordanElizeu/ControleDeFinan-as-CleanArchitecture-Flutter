import 'package:controle_financeiro/layers/login/domain/entities/sign_in_firebase_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignInUseCase {
  Future<Either<Exception, SignInFirebaseEntity>> call({
    required SignInFirebaseEntity signInEntity,
  });
}
