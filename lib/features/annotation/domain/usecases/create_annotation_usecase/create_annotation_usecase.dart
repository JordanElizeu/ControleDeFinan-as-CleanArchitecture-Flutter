import 'package:controle_financeiro/features/annotation/domain/entities/annotation_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CreateAnnotationUseCase {
  Future<Either<Exception, AnnotationEntity>> call({required AnnotationEntity annotationEntity});
}
