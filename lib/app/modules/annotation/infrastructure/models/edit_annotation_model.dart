import '../../domain/entities/entities.dart';

class EditAnnotationModel extends EditAnnotationEntity {
  EditAnnotationModel({
    required String title,
    required String description,
    required String id,
  }) : super(
          title: title,
          description: description,
          id: id,
        );
}
