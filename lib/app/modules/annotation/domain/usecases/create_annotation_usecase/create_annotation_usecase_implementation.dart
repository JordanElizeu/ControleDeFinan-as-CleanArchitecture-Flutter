import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class CreateAnnotationUseCaseImplementation implements CreateAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  CreateAnnotationUseCaseImplementation(this._annotationRepository);

  @override
  Future<Either<Exception, AnnotationEntity>> call(
      {required AnnotationEntity annotationEntity}) async {
    if (annotationEntity.title.isNotEmpty &&
        annotationEntity.description.isNotEmpty) {
      return await _annotationRepository.createAnnotation(annotationEntity: annotationEntity);
    } else {
      return Left(Exception(
        'Título ou descrição vazio, preencha-os corretamente!',
      ));
    }
  }
}
