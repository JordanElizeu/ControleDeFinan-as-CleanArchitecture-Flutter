import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/features/login/domain/usecases/register_account_usecase/register_account_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterAccountUseCaseImp implements RegisterAccountUseCase {
  @override
  Future<Either<Exception, RegisterAccountEntity>> registerAccount(
      {required RegisterAccountEntity registerAccountEntity}) {
    // TODO: implement registerAccount
    throw UnimplementedError();
  }
}
