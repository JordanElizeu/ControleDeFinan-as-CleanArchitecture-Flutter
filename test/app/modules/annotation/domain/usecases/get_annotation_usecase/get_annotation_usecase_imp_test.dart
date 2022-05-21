import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/annotation/domain/entities/entities.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/usecases/usecases.dart';

class AnnotationRepositoryMock extends Mock implements AnnotationRepository {}

main() {
  late AnnotationRepositoryMock annotationRepositoryMock;
  late GetAnnotationUseCaseImplementation getAnnotationUseCaseImp;
  setUp(() {
    annotationRepositoryMock = AnnotationRepositoryMock();
    getAnnotationUseCaseImp = GetAnnotationUseCaseImplementation(annotationRepositoryMock);
  });

  test('should return a list empty', () async {
    late final List<AnnotationEntity> listExpected;
    when(() => annotationRepositoryMock.getTodo())
        .thenAnswer((_) async => const Right([]));
    final result = await getAnnotationUseCaseImp.call();
    result.fold((error) => null, (success) => listExpected = success);
    expect(listExpected, []);
  });
}
