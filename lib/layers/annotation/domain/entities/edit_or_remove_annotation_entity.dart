import 'package:controle_financeiro/layers/annotation/domain/entities/annotation_entity.dart';

class EditOrRemoveAnnotationEntity extends AnnotationEntity {
  final int id;

  EditOrRemoveAnnotationEntity({
    required String title,
    required String description,
    required this.id,
  }) : super(
          title: title,
          description: description,
        );
}
