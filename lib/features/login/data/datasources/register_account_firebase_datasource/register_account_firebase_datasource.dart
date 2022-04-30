import 'package:controle_financeiro/features/login/data/model/register_account_model.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/register_account_entity.dart';

abstract class RegisterAccountFirebaseDataSource{
  Future<Either<Exception, RegisterAccountModel>> call({
    required RegisterAccountEntity registerAccountEntity,
  });
}