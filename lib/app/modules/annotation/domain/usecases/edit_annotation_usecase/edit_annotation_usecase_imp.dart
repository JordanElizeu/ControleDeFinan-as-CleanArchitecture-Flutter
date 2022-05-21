import 'package:dartz/dartz.dart';

import '../../entities/edit_or_remove_annotation_entity.dart';
import '../../repositories/annotation_repository.dart';
import 'edit_annotation_usecase.dart';

class EditAnnotationUseCaseImp implements EditAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  EditAnnotationUseCaseImp(this._annotationRepository);

  @override
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> call(
      {required EditOrRemoveAnnotationEntity editAnnotationEntity}) async {
    if (editAnnotationEntity.description.isNotEmpty &&
        editAnnotationEntity.title.isNotEmpty &&
        editAnnotationEntity.id >= 0) {
      return await _annotationRepository.editAnnotation(editAnnotationEntity: editAnnotationEntity);
    } else {
      return Left(Exception('Erro ao editar anotação'));
    }
  }
}
