import 'package:controle_financeiro/features/login/domain/entities/sign_in_entity.dart';

class RegisterAccountEntity extends SignInEntity {
  final String name;
  RegisterAccountEntity(
      {required String password, required String email, required this.name})
      : super(password: password, email: email);
}
