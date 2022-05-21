import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class EditAnnotationUseCaseImplementation implements EditAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  EditAnnotationUseCaseImplementation(this._annotationRepository);

  @override
  Future<Either<Exception, EditAnnotationEntity>> call(
      {required EditAnnotationEntity editAnnotationEntity}) async {
    if (editAnnotationEntity.description.isNotEmpty &&
        editAnnotationEntity.title.isNotEmpty &&
        editAnnotationEntity.id.isNotEmpty) {
      return await _annotationRepository.editAnnotation(editAnnotationEntity: editAnnotationEntity);
    } else {
      return Left(Exception('Erro ao editar anotação'));
    }
  }
}
