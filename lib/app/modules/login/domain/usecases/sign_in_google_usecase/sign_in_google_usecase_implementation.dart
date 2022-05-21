import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login_repository.dart';
import '../usecases.dart';

class SignInGoogleUseCaseImplementation implements SignInGoogleUseCase {
  final LoginRepository _loginRepository;

  SignInGoogleUseCaseImplementation(this._loginRepository);

  @override
  Future<Either<Exception, User>> call() {
    return _loginRepository.signInGoogle();
  }
}
