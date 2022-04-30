import 'package:controle_financeiro/features/login/domain/entities/sign_in_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignInUseCase {
  Future<Either<Exception, SignInEntity>> signIn({
    required SignInEntity signInModel,
  });
}
