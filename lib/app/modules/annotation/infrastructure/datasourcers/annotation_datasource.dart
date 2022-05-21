import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';

abstract class AnnotationDataSource {
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity});
  Future<Either<Exception, EditAnnotationEntity>> editAnnotation(
      {required EditAnnotationEntity editAnnotationEntity});
  Future<Either<Exception, EditAnnotationEntity>> removeAnnotation(
      {required EditAnnotationEntity editOrRemoveAnnotationEntity});
  Future<Either<Exception, List<AnnotationEntity>>> getTodo();
}
