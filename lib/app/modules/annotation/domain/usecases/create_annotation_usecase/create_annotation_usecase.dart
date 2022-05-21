import 'package:dartz/dartz.dart';

import '../../entities/annotation_entity.dart';

abstract class CreateAnnotationUseCase {
  Future<Either<Exception, AnnotationEntity>> call(
      {required AnnotationEntity annotationEntity});
}
