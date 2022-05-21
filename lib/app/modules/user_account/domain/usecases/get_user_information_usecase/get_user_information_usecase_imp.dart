import 'package:dartz/dartz.dart';

import '../../entities/user_information_entity.dart';
import '../../repositories/user_information_repository.dart';
import 'get_user_information_usecase.dart';

class GetUserInformationUseCaseImp implements GetUserInformationUseCase {
  final UserInformationRepository _userInformationRepository;

  GetUserInformationUseCaseImp(this._userInformationRepository);

  @override
  Future<Either<Exception, UserInformationEntity>> call() async {
    return await _userInformationRepository.getUserFirebaseInformation();
  }
}
