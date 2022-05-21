import 'package:controle_financeiro/app/modules/annotation/domain/entities/annotation_entity.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/repositories/annotation_repository.dart';
import 'package:controle_financeiro/app/modules/annotation/domain/usecases/get_annotation_usecase/get_annotation_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnotationRepositoryMock extends Mock implements AnnotationRepository {}

main() {
  late AnnotationRepositoryMock annotationRepositoryMock;
  late GetAnnotationUseCaseImp getAnnotationUseCaseImp;
  setUp(() {
    annotationRepositoryMock = AnnotationRepositoryMock();
    getAnnotationUseCaseImp = GetAnnotationUseCaseImp(annotationRepositoryMock);
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
