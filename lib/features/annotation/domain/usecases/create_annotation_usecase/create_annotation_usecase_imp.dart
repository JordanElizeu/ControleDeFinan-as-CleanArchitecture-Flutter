import 'package:controle_financeiro/features/annotation/domain/entities/annotation_entity.dart';
import 'package:controle_financeiro/features/annotation/domain/repositories/annotation_repository.dart';
import 'package:dartz/dartz.dart';
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
