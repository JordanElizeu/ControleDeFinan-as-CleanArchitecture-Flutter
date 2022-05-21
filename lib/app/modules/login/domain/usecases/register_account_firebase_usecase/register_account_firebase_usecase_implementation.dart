import 'package:dartz/dartz.dart';

import '../../../../../shared/utils/utils.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class RegisterAccountUseCaseImplementation implements RegisterAccountUseCase {
  final LoginRepository _loginRepository;

  RegisterAccountUseCaseImplementation(this._loginRepository);

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
