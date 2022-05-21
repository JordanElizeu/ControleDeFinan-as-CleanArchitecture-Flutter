import 'package:dartz/dartz.dart';

import '../../entities/annotation_entity.dart';
import '../../repositories/annotation_repository.dart';
import 'create_annotation_usecase.dart';

class CreateAnnotationUseCaseImp implements CreateAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  CreateAnnotationUseCaseImp(this._annotationRepository);

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
