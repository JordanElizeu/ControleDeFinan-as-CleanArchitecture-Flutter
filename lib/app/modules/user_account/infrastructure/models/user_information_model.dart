import '../../domain/entities/entities.dart';

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
