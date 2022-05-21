import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class RemoveAnnotationUseCase {
  Future<Either<Exception, RemoveAnnotationEntity>> call({
    required RemoveAnnotationEntity removeAnnotationEntity,
  });
}
