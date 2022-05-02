import 'package:controle_financeiro/features/annotation/domain/entities/annotation_entity.dart';
import 'package:controle_financeiro/features/annotation/domain/entities/edit_or_remove_annotation_entity.dart';
import 'package:controle_financeiro/features/annotation/domain/repositories/annotation_repository.dart';
import 'package:dartz/dartz.dart';

class AnnotationRepositoryImp implements AnnotationRepository {
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
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> removeAnnotation(
      {required EditOrRemoveAnnotationEntity editOrRemoveAnnotationEntity}) {
    // TODO: implement removeAnnotation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getTodo() {
    // TODO: implement getTodo
    throw UnimplementedError();
  }
}
