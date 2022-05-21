import 'package:controle_financeiro/app/modules/annotation/domain/entities/edit_annotation_entity.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/repositories/annotation_repository.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/usecases/edit_annotation_usecase/edit_annotation_usecase_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnotationRepositoryMock extends Mock implements AnnotationRepository {}

main() {
  late AnnotationRepositoryMock annotationRepositoryMock;
  late EditAnnotationUseCaseImplementation editAnnotationUseCaseImp;
  setUp(() {
    annotationRepositoryMock = AnnotationRepositoryMock();
    editAnnotationUseCaseImp =
        EditAnnotationUseCaseImplementation(annotationRepositoryMock);
  });

  test('should return exception because title is empty', () async {
    late final Exception exception;
    final editAnnotationEntity = EditAnnotationEntity(
      title: '',
      description: 'description',
      id: 0,
    );
    final result = await editAnnotationUseCaseImp.call(
        editAnnotationEntity: editAnnotationEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because description is empty', () async {
    late final Exception exception;
    final editAnnotationEntity = EditAnnotationEntity(
      title: 'title',
      description: '',
      id: 0,
    );
    final result = await editAnnotationUseCaseImp.call(
        editAnnotationEntity: editAnnotationEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because id is negative', () async {
    late final Exception exception;
    final editAnnotationEntity = EditAnnotationEntity(
      title: 'title',
      description: 'description',
      id: -1,
    );
    final result = await editAnnotationUseCaseImp.call(
        editAnnotationEntity: editAnnotationEntity);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return EditAnnotationEntity', () async {
    late final EditAnnotationEntity editAnnotationEntityExpected;
    final editAnnotationEntity = EditAnnotationEntity(
      title: 'title',
      description: 'description',
      id: 0,
    );
    when(() => annotationRepositoryMock.editAnnotation(
            editAnnotationEntity: editAnnotationEntity))
        .thenAnswer((_) async => Right(editAnnotationEntity));
    final result = await editAnnotationUseCaseImp.call(
        editAnnotationEntity: editAnnotationEntity);
    result.fold(
      (error) => null,
      (success) => editAnnotationEntityExpected = success,
    );
    expect(editAnnotationEntityExpected, editAnnotationEntity);
  });
}
