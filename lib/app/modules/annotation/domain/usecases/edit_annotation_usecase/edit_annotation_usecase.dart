import 'package:dartz/dartz.dart';

import '../../entities/edit_or_remove_annotation_entity.dart';

abstract class EditAnnotationUseCase {
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> call(
      {required EditOrRemoveAnnotationEntity editAnnotationEntity});
}
