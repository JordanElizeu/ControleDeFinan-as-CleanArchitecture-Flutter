import '../../domain/entities/entities.dart';

class SignInFirebaseModel extends SignInFirebaseEntity {
  SignInFirebaseModel({required String password, required String email})
      : super(password: password, email: email);
}
