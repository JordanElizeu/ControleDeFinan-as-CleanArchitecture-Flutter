import 'package:dartz/dartz.dart';

abstract class SignInGoogleUseCase {
  Future<Either<Exception, bool>> call();
}
