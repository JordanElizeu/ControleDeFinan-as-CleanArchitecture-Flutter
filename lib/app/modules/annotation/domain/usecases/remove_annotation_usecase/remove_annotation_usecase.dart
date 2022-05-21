import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class RemoveAnnotationUseCase {
  Future<Either<Exception, EditAnnotationEntity>> call({
    required EditAnnotationEntity editOrRemoveAnnotationEntity,
  });
}
