import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class GetAnnotationUseCase {
  Future<Either<Exception, List<AnnotationEntity>>> call();
}
