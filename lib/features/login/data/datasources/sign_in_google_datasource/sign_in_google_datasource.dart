import 'package:dartz/dartz.dart';

abstract class SignInGoogleDataSource{
  Future<Either<Exception, void>> call();
}