import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class CreateAnnotationUseCase {
  Future<Either<Exception, AnnotationEntity>> call(
      {required AnnotationEntity annotationEntity});
}
