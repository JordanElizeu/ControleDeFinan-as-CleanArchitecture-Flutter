import 'package:controle_financeiro/features/login/domain/entities/sign_in_entity.dart';
import 'package:controle_financeiro/features/login/domain/usecases/sign_in_usecase/sign_in_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/validation/email_validation.dart';

class SignInUseCaseImp implements SignInUseCase {
  @override
  Future<Either<Exception, SignInEntity>> signIn(
      {required SignInEntity signInEntity}) async {
    if (EmailValidation.validateEmail(signInEntity.email) &&
        signInEntity.password.length >= 6) {
      return Right(signInEntity);
    } else {
      return Left(Exception('erro ocorrido'));
    }
  }
}
