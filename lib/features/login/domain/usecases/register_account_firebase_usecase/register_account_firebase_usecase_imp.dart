import 'package:controle_financeiro/features/login/domain/entities/register_account_entity.dart';
import 'package:controle_financeiro/features/login/domain/repositories/login_repository.dart';
import 'package:controle_financeiro/features/login/domain/usecases/register_account_firebase_usecase/register_account_firebase_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/validation/email_validation.dart';

class RegisterAccountUseCaseImp implements RegisterAccountUseCase {
  final LoginRepository _loginRepository;

  RegisterAccountUseCaseImp(this._loginRepository);

  @override
  Future<Either<Exception, RegisterAccountEntity>> call(
      {required RegisterAccountEntity registerAccountEntity}) async {
    if (registerAccountEntity.name.isNotEmpty &&
        EmailValidation.validateEmail(registerAccountEntity.email) &&
        registerAccountEntity.password.length >= 6) {
      return _loginRepository.registerAccount(
          registerAccountEntity: registerAccountEntity);
    } else {
      return Left(Exception('erro não esperado'));
    }
  }
}
