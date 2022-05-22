import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInGoogleDatasource{
  Future<User> signInGoogle();
}