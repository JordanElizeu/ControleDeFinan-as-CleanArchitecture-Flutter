import '../../domain/entities/entities.dart';

class RegisterAccountModel extends RegisterAccountEntity {
  RegisterAccountModel(
      {required String password, required String email, required String name})
      : super(password: password, email: email, name: name);
}
