import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInGoogleDataSource{
  Future<Either<Exception, User>> signInGoogle();
}