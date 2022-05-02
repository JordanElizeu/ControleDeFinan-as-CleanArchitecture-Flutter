import 'package:controle_financeiro/layers/annotation/data/datasources/firebase/annotation_datasource/annotation_datasource.dart';
import 'package:controle_financeiro/layers/annotation/domain/entities/annotation_entity.dart';
import 'package:controle_financeiro/layers/annotation/domain/entities/edit_or_remove_annotation_entity.dart';
import 'package:dartz/dartz.dart';

class AnnotationDataSourceImp implements AnnotationDataSource {
  @override
  Future<Either<Exception, AnnotationEntity>> createAnnotation(
      {required AnnotationEntity annotationEntity}) {
    // TODO: implement createAnnotation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> editAnnotation(
      {required EditOrRemoveAnnotationEntity editAnnotationEntity}) {
    // TODO: implement editAnnotation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getTodo() {
    // TODO: implement getTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> removeAnnotation(
      {required EditOrRemoveAnnotationEntity editOrRemoveAnnotationEntity}) {
    // TODO: implement removeAnnotation
    throw UnimplementedError();
  }
}
