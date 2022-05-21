import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class GetUserInformationUseCaseImplementation
    implements GetUserInformationUseCase {
  final UserInformationRepository _userInformationRepository;

  GetUserInformationUseCaseImplementation(this._userInformationRepository);

  @override
  Future<Either<Exception, UserInformationEntity>> call() async {
    return await _userInformationRepository.getUserFirebaseInformation();
  }
}
