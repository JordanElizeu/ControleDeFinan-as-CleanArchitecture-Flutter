import 'package:controle_financeiro/features/login/domain/repositories/login_repository.dart';
import 'package:controle_financeiro/features/login/domain/usecases/sign_in_google_usecase/sign_in_google_usecase.dart';
import 'package:dartz/dartz.dart';

class SignInGoogleUseCaseImp implements SignInGoogleUseCase {
  final LoginRepository _loginRepository;

  SignInGoogleUseCaseImp(this._loginRepository);

  @override
  Future<Either<Exception, void>> call() {
    return _loginRepository.signInGoogle();
  }
}
