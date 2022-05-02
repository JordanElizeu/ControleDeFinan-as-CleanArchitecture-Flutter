import 'package:controle_financeiro/layers/annotation/domain/entities/edit_or_remove_annotation_entity.dart';
import 'package:controle_financeiro/layers/annotation/domain/repositories/annotation_repository.dart';
import 'package:controle_financeiro/layers/annotation/domain/usecases/remove_annotation_usecase/remove_annotation_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnotationRepositoryMock extends Mock implements AnnotationRepository {}

main() {
  late AnnotationRepositoryMock annotationRepositoryMock;
  late RemoveAnnotationUseCaseImp removeAnnotationUseCaseImp;
  setUp(() {
    annotationRepositoryMock = AnnotationRepositoryMock();
    removeAnnotationUseCaseImp =
        RemoveAnnotationUseCaseImp(annotationRepositoryMock);
  });

  test('should return a list empty', () async {
    late final EditOrRemoveAnnotationEntity
        editOrRemoveAnnotationEntityExpected;
    final editOrRemoveAnnotationEntity = EditOrRemoveAnnotationEntity(
      title: 'title',
      description: 'description',
      id: 0,
    );
    when(() => annotationRepositoryMock.removeAnnotation(
            editOrRemoveAnnotationEntity: editOrRemoveAnnotationEntity))
        .thenAnswer((_) async => Right(editOrRemoveAnnotationEntity));
    final result = await removeAnnotationUseCaseImp.call(
      editOrRemoveAnnotationEntity: editOrRemoveAnnotationEntity,
    );
    result.fold(
      (error) => null,
      (success) => editOrRemoveAnnotationEntityExpected = success,
    );
    expect(editOrRemoveAnnotationEntityExpected, editOrRemoveAnnotationEntity);
  });
}
