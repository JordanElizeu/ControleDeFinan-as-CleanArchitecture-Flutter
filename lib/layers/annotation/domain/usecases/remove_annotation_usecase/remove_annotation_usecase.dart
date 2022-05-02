import 'package:controle_financeiro/layers/annotation/domain/entities/edit_or_remove_annotation_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RemoveAnnotationUseCase {
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> call({
    required EditOrRemoveAnnotationEntity editOrRemoveAnnotationEntity,
  });
}
