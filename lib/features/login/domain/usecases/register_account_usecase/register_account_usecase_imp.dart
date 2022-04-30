import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/features/login/domain/usecases/register_account_usecase/register_account_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/validation/email_validation.dart';

class RegisterAccountUseCaseImp implements RegisterAccountUseCase {
  @override
  Future<Either<Exception, RegisterAccountEntity>> registerAccount(
      {required RegisterAccountEntity registerAccountEntity}) async {
    if (registerAccountEntity.name.isNotEmpty &&
        EmailValidation.validateEmail(registerAccountEntity.email) &&
        registerAccountEntity.password.length >= 6) {
      return Right(registerAccountEntity);
    } else {
      return Left(Exception('erro não esperado'));
    }
  }
}
