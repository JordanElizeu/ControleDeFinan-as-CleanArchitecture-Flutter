import 'package:dartz/dartz.dart';

import '../../entities/annotation_entity.dart';
import '../../repositories/annotation_repository.dart';
import 'get_annotation_usecase.dart';

class GetAnnotationUseCaseImp implements GetAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  GetAnnotationUseCaseImp(this._annotationRepository);

  @override
  Future<Either<Exception, List<AnnotationEntity>>> call() async {
    return await _annotationRepository.getTodo();
  }
}
