import 'package:dartz/dartz.dart';

import '../../entities/register_account_entity.dart';

abstract class RegisterAccountUseCase {
  Future<Either<Exception, RegisterAccountEntity>> call({
    required RegisterAccountEntity registerAccountEntity,
  });
}
