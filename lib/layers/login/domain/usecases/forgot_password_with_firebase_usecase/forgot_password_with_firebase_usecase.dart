import 'package:dartz/dartz.dart';

abstract class ForgotPasswordWithFirebaseUseCase {
  Future<Either<Exception, bool>> call({required String email});
}
