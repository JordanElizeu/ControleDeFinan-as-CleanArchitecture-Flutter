import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';

abstract class AnnotationDataSource {
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity});
  Future<Either<Exception, EditAnnotationEntity>> editAnnotation(
      {required EditAnnotationEntity editAnnotationEntity});
  Future<Either<Exception, RemoveAnnotationEntity>> removeAnnotation(
      {required RemoveAnnotationEntity removeAnnotationEntity});
  Future<Either<Exception, List<AnnotationEntity>>> getTodo();
}
