import '../../domain/entities/entities.dart';

class AnnotationModel extends AnnotationEntity {
  AnnotationModel({required String title, required String description})
      : super(title: title, description: description);

  factory AnnotationModel.fromMap(Map<String, dynamic> map) => AnnotationModel(
        title: map['title'] ?? '',
        description: map['description'] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}
