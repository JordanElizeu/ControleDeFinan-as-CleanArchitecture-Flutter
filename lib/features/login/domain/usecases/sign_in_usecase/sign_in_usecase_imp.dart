import 'package:controle_financeiro/features/login/domain/entities/sign_in_entity.dart';
import 'package:controle_financeiro/features/login/domain/usecases/sign_in_usecase/sign_in_usecase.dart';
import 'package:dartz/dartz.dart';

class SignInUseCaseImp implements SignInUseCase {
  @override
  Future<Either<Exception, SignInEntity>> signIn(
      {required SignInEntity signInModel}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
