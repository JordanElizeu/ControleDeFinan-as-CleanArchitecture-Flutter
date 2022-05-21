import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:controle_financeiro/app/modules/user_account/domain/entities/entities.dart';
import 'package:controle_financeiro/app/modules/user_account/domain/repositories/repositories.dart';
import 'package:controle_financeiro/app/modules/user_account/domain/usecases/usecases.dart';

class UserInformationRepositoryMock extends Mock
    implements UserInformationRepository {}

main() {
  late UserInformationRepository userInformationRepository;
  late GetUserInformationUseCaseImplementation getUserInformationUseCaseImp;
  setUp(() {
    userInformationRepository = UserInformationRepositoryMock();
    getUserInformationUseCaseImp =
        GetUserInformationUseCaseImplementation(userInformationRepository);
  });
  test('should return userInformationEntity with information of user',
      () async {
    late final UserInformationEntity userInformationEntityExpected;
    final userInformationEntity =
        UserInformationEntity(name: 'name', email: 'email');
    when(() => userInformationRepository.getUserFirebaseInformation())
        .thenAnswer((_) async => Right(userInformationEntity));
    final result = await getUserInformationUseCaseImp.call();
    result.fold(
        (error) => null, (success) => userInformationEntityExpected = success);
    expect(userInformationEntityExpected, userInformationEntity);
  });
}
