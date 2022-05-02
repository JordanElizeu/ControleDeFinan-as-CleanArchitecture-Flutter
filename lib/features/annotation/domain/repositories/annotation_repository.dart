import 'package:dartz/dartz.dart';
import '../entities/annotation_entity.dart';
import '../entities/edit_or_remove_annotation_entity.dart';

abstract class AnnotationRepository {
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity});
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> editAnnotation(
      {required EditOrRemoveAnnotationEntity editAnnotationEntity});
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> removeAnnotation(
      {required EditOrRemoveAnnotationEntity editOrRemoveAnnotationEntity});
  Future<Either<Exception, List<AnnotationEntity>>> getTodo();
}
