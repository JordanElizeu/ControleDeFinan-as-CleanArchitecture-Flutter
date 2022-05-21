import 'package:controle_financeiro/app/modules/annotation/domain/entities/annotation_entity.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/repositories/annotation_repository.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/usecases/create_annotation_usecase/create_annotation_usecase_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnotationRepositoryMock extends Mock implements AnnotationRepository {}

main() {
  late AnnotationRepositoryMock annotationRepositoryMock;
  late CreateAnnotationUseCaseImplementation createAnnotationUseCaseImp;
  setUp(() {
    annotationRepositoryMock = AnnotationRepositoryMock();
    createAnnotationUseCaseImp =
        CreateAnnotationUseCaseImplementation(annotationRepositoryMock);
  });
  test('should return exception because title is empty', () async {
    late final Exception exception;
    final annotation = AnnotationEntity(
      title: '',
      description: 'description',
    );
    final result =
        await createAnnotationUseCaseImp.call(annotationEntity: annotation);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because description is empty', () async {
    late final Exception exception;
    final annotation = AnnotationEntity(
      title: 'title',
      description: '',
    );
    final result =
    await createAnnotationUseCaseImp.call(annotationEntity: annotation);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return exception because description and title is empty', () async {
    late final Exception exception;
    final annotation = AnnotationEntity(
      title: '',
      description: '',
    );
    final result =
    await createAnnotationUseCaseImp.call(annotationEntity: annotation);
    result.fold((error) => exception = error, (success) => null);
    expect(exception, isException);
  });

  test('should return AnnotationEntity', () async {
    late final AnnotationEntity annotationEntityExpected;
    final annotation = AnnotationEntity(
      title: 'title',
      description: 'description',
    );
    when(() => annotationRepositoryMock.createAnnotation(
            annotationEntity: annotation))
        .thenAnswer((_) async => Right(annotation));
    final result =
        await createAnnotationUseCaseImp.call(annotationEntity: annotation);
    result.fold(
      (error) => null,
      (success) => annotationEntityExpected = success,
    );
    expect(annotationEntityExpected, annotation);
  });
}
