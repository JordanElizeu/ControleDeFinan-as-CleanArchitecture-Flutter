import 'package:controle_financeiro/layers/login/domain/entities/register_account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterAccountUseCase {
  Future<Either<Exception, RegisterAccountEntity>> call({
    required RegisterAccountEntity registerAccountEntity,
  });
}
