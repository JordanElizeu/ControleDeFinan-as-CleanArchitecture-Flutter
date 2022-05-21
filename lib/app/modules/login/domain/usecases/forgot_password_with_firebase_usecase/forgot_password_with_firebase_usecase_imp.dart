import 'package:dartz/dartz.dart';
import '../../../../../shared/utils/email_validation.dart';
import '../../repositories/login_repository.dart';
import 'forgot_password_with_firebase_usecase.dart';

class ForgotPasswordWithFirebaseUseCaseImp
    implements ForgotPasswordWithFirebaseUseCase {
  final LoginRepository _loginRepository;

  ForgotPasswordWithFirebaseUseCaseImp(this._loginRepository);

  @override
  Future<Either<Exception, void>> call({required String email}) async {
    if (email.isNotEmpty && EmailValidation.validateEmail(email)) {
      return await _loginRepository.forgotPasswordWithFirebase(email: email);
    } else {
      return Left(Exception('Erro: email inválido'));
    }
  }
}
