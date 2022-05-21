import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasourcers/datasourcers.dart';

class AnnotationRepositoryImplementation implements AnnotationRepository {
  final AnnotationDataSource _annotationDataSource;

  AnnotationRepositoryImplementation(this._annotationDataSource);

  @override
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity}) {
    return _annotationDataSource.createAnnotation(
        annotationEntity: annotationEntity);
  }

  @override
  Future<Either<Exception, EditAnnotationEntity>> editAnnotation(
      {required EditAnnotationEntity editAnnotationEntity}) {
    return _annotationDataSource.editAnnotation(
        editAnnotationEntity: editAnnotationEntity);
  }

  @override
  Future<Either<Exception, EditAnnotationEntity>> removeAnnotation(
      {required EditAnnotationEntity editOrRemoveAnnotationEntity}) {
    return _annotationDataSource.removeAnnotation(
        editOrRemoveAnnotationEntity: editOrRemoveAnnotationEntity);
  }

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getTodo() {
    return _annotationDataSource.getTodo();
  }
}
