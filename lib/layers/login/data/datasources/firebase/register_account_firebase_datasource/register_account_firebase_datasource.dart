import 'package:dartz/dartz.dart';
import '../../../../domain/entities/register_account_entity.dart';

abstract class RegisterAccountFirebaseDataSource {
  Future<Either<Exception, RegisterAccountEntity>> call({
    required RegisterAccountEntity registerAccountEntity,
  });
}
