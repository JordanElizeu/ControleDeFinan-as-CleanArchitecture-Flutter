import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class RemoveAnnotationUseCaseImplementation implements RemoveAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  RemoveAnnotationUseCaseImplementation(this._annotationRepository);

  @override
  Future<Either<Exception, RemoveAnnotationEntity>> call(
      {required RemoveAnnotationEntity removeAnnotationEntity}) async {
    return await _annotationRepository.removeAnnotation(
      removeAnnotationEntity: removeAnnotationEntity,
    );
  }
}
