import 'package:controle_financeiro/features/annotation/domain/repositories/annotation_repository.dart';
import 'package:controle_financeiro/features/annotation/domain/usecases/remove_annotation_usecase/remove_annotation_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../entities/edit_or_remove_annotation_entity.dart';

class RemoveAnnotationUseCaseImp implements RemoveAnnotationUseCase {
  final AnnotationRepository _annotationRepository;

  RemoveAnnotationUseCaseImp(this._annotationRepository);

  @override
  Future<Either<Exception, EditOrRemoveAnnotationEntity>> call(
      {required EditOrRemoveAnnotationEntity editOrRemoveAnnotationEntity}) async {
    return await _annotationRepository.removeAnnotation(
      editOrRemoveAnnotationEntity: editOrRemoveAnnotationEntity,
    );
  }
}
