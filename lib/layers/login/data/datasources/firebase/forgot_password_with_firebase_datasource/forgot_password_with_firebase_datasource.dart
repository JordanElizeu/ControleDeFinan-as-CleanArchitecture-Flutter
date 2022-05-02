import 'package:dartz/dartz.dart';

abstract class ForgotPasswordWithFirebaseDataSource{
  Future<Either<Exception, bool>> call({required String email});
}