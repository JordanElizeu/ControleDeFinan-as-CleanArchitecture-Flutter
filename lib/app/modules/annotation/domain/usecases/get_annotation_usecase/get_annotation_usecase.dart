import 'package:dartz/dartz.dart';
import '../../entities/annotation_entity.dart';

abstract class GetAnnotationUseCase {
  Future<Either<Exception, List<AnnotationEntity>>> call();
}
