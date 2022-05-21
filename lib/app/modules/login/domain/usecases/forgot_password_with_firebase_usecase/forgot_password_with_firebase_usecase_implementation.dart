import 'package:dartz/dartz.dart';

import '../../../../../shared/utils/utils.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class ForgotPasswordWithFirebaseUseCaseImplementation
    implements ForgotPasswordWithFirebaseUseCase {
  final LoginRepository _loginRepository;

  ForgotPasswordWithFirebaseUseCaseImplementation(this._loginRepository);

  @override
  Future<Either<Exception, void>> call({required String email}) async {
    if (email.isNotEmpty && EmailValidation.validateEmail(email)) {
      return await _loginRepository.forgotPasswordWithFirebase(email: email);
    } else {
      return Left(Exception('Erro: email inválido'));
    }
  }
}
