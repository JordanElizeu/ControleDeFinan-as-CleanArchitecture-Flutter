import 'package:controle_financeiro/features/login/domain/entities/sign_in_firebase_entity.dart';

class SignInFirebaseModel extends SignInFirebaseEntity {
  SignInFirebaseModel({required String password, required String email})
      : super(password: password, email: email);
}
