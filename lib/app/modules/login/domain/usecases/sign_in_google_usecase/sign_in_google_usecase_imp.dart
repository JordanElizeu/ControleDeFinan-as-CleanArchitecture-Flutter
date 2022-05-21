import 'package:controle_financeiro/app/modules/login/domain/usecases/sign_in_google_usecase/sign_in_google_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login_repository.dart';

class SignInGoogleUseCaseImp implements SignInGoogleUseCase {
  final LoginRepository _loginRepository;

  SignInGoogleUseCaseImp(this._loginRepository);

  @override
  Future<Either<Exception, User>> call() {
    return _loginRepository.signInGoogle();
  }
}
