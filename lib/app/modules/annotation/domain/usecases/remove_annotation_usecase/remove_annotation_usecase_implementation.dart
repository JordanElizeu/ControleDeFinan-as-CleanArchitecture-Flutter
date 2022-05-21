import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class RemoveAnnotationUseCaseImplementation implements RemoveAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  RemoveAnnotationUseCaseImplementation(this._annotationRepository);

  @override
  Future<Either<Exception, EditAnnotationEntity>> call(
      {required EditAnnotationEntity editOrRemoveAnnotationEntity}) async {
    return await _annotationRepository.removeAnnotation(
      editOrRemoveAnnotationEntity: editOrRemoveAnnotationEntity,
    );
  }
}
