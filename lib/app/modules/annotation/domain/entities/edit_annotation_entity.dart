import 'entities.dart';

class EditAnnotationEntity extends AnnotationEntity {
  final String id;

  EditAnnotationEntity({
    required String title,
    required String description,
    required this.id,
  }) : super(
          title: title,
          description: description,
        );
}
