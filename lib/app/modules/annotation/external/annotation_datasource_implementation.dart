import 'package:dartz/dartz.dart';

import '../domain/entities/entities.dart';
import '../infrastructure/datasourcers/datasourcers.dart';

class AnnotationDataSourceImplementation implements AnnotationDataSource {
  @override
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity}) {
    // TODO: implement createAnnotation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, EditAnnotationEntity>> editAnnotation(
      {required EditAnnotationEntity editAnnotationEntity}) {
    // TODO: implement editAnnotation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getTodo() {
    // TODO: implement getTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, EditAnnotationEntity>> removeAnnotation(
      {required EditAnnotationEntity editOrRemoveAnnotationEntity}) {
    // TODO: implement removeAnnotation
    throw UnimplementedError();
  }
}
