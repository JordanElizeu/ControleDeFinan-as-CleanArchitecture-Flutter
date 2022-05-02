import 'package:controle_financeiro/layers/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/validation/email_validation.dart';
import 'forgot_password_with_firebase_usecase.dart';

class ForgotPasswordWithFirebaseUseCaseImp
    implements ForgotPasswordWithFirebaseUseCase {
  final LoginRepository _loginRepository;

  ForgotPasswordWithFirebaseUseCaseImp(this._loginRepository);

  @override
  Future<Either<Exception, bool>> call({required String email}) async {
    if (email.isNotEmpty && EmailValidation.validateEmail(email)) {
      return _loginRepository.forgotPasswordWithFirebase(email: email);
    } else {
      return Left(Exception('Erro: email inválido'));
    }
  }
}
