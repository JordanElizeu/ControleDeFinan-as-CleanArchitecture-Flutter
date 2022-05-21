import 'package:controle_financeiro/app/modules/annotation/domain/entities/edit_annotation_entity.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/repositories/annotation_repository.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/usecases/remove_annotation_usecase/remove_annotation_usecase_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnotationRepositoryMock extends Mock implements AnnotationRepository {}

main() {
  late AnnotationRepositoryMock annotationRepositoryMock;
  late RemoveAnnotationUseCaseImplementation removeAnnotationUseCaseImp;
  setUp(() {
    annotationRepositoryMock = AnnotationRepositoryMock();
    removeAnnotationUseCaseImp =
        RemoveAnnotationUseCaseImplementation(annotationRepositoryMock);
  });

  test('should return a list empty', () async {
    late final EditAnnotationEntity
        editOrRemoveAnnotationEntityExpected;
    final editOrRemoveAnnotationEntity = EditAnnotationEntity(
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
