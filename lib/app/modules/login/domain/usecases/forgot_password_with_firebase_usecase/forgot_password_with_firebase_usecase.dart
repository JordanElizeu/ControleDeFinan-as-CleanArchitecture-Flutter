import 'package:dartz/dartz.dart';

abstract class ForgotPasswordWithFirebaseUseCase {
  Future<Either<Exception, void>> call({required String email});
}
