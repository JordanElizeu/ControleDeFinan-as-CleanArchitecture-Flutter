import 'package:controle_financeiro/features/user_account/domain/entities/user_information_entity.dart';

class UserInformationModel extends UserInformationEntity {
  UserInformationModel({required String name, required String email})
      : super(name: name, email: email);

  factory UserInformationModel.fromMap(Map<String, dynamic>? map) =>
      UserInformationModel(
        name: map?['name'] ?? '',
        email: map?['email'] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
