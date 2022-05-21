import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class EditAnnotationUseCase {
  Future<Either<Exception, EditAnnotationEntity>> call(
      {required EditAnnotationEntity editAnnotationEntity});
}
