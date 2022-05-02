import 'package:controle_financeiro/layers/annotation/domain/entities/annotation_entity.dart';
import 'package:controle_financeiro/layers/annotation/domain/repositories/annotation_repository.dart';
import 'package:dartz/dartz.dart';
import 'get_annotation_usecase.dart';

class GetAnnotationUseCaseImp implements GetAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  GetAnnotationUseCaseImp(this._annotationRepository);

  @override
  Future<Either<Exception, List<AnnotationEntity>>> call() async {
    return await _annotationRepository.getTodo();
  }
}
