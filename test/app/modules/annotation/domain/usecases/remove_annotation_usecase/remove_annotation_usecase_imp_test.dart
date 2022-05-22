import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/annotation/domain/entities/entities.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/usecases/usecases.dart';

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
    late final RemoveAnnotationEntity removeAnnotationEntityExpected;
    final removeAnnotationEntity = RemoveAnnotationEntity('');
    when(() => annotationRepositoryMock.removeAnnotation(
            removeAnnotationEntity: removeAnnotationEntity))
        .thenAnswer((_) async => Right(removeAnnotationEntity));
    final result = await removeAnnotationUseCaseImp.call(
      removeAnnotationEntity: removeAnnotationEntity,
    );
    result.fold(
      (error) => null,
      (success) => removeAnnotationEntityExpected = success,
    );
    expect(removeAnnotationEntityExpected, removeAnnotationEntity);
  });
}
