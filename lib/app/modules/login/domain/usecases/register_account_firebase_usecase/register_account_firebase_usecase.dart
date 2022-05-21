import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class RegisterAccountUseCase {
  Future<Either<Exception, RegisterAccountEntity>> call({
    required RegisterAccountEntity registerAccountEntity,
  });
}
