import '../entities/entities.dart';

class RegisterAccountEntity extends SignInFirebaseEntity {
  final String name;
  RegisterAccountEntity(
      {required String password, required String email, required this.name})
      : super(password: password, email: email);
}
