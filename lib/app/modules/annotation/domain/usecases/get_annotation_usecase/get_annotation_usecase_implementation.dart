import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class GetAnnotationUseCaseImplementation implements GetAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  GetAnnotationUseCaseImplementation(this._annotationRepository);

  @override
  Future<Either<Exception, List<AnnotationEntity>>> call() async {
    return await _annotationRepository.getTodo();
  }
}
