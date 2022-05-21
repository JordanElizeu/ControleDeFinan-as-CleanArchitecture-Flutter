import 'package:controle_financeiro/app/modules/user_account/domain/entities/user_information_entity.dart';
import 'package:controle_financeiro/app/modules/user_account/domain/repositories/user_information_repository.dart';
import 'package:controle_financeiro/app/modules/user_account/domain/usecases/get_user_information_usecase/get_user_information_usecase_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserInformationRepositoryMock extends Mock
    implements UserInformationRepository {}

main() {
  late UserInformationRepository userInformationRepository;
  late GetUserInformationUseCaseImp getUserInformationUseCaseImp;
  setUp(() {
    userInformationRepository = UserInformationRepositoryMock();
    getUserInformationUseCaseImp =
        GetUserInformationUseCaseImp(userInformationRepository);
  });
  test('should return userInformationEntity with information of user', () async {
    late final UserInformationEntity userInformationEntityExpected;
    final userInformationEntity =
        UserInformationEntity(name: 'name', email: 'email');
    when(() => userInformationRepository.getUserFirebaseInformation())
        .thenAnswer((_) async => Right(userInformationEntity));
    final result = await getUserInformationUseCaseImp.call();
    result.fold((error) => null, (success) => userInformationEntityExpected = success);
    expect(userInformationEntityExpected, userInformationEntity);
  });
}
