import 'package:dartz/dartz.dart';

import '../../domain/entities/user_information_entity.dart';
import '../../domain/repositories/user_information_repository.dart';
import '../datasources/firebase/get_user_information_datasource.dart';

class UserInformationRepositoryImp implements UserInformationRepository {
  final GetUserInformationDataSource _getUserInformationDataSource;

  UserInformationRepositoryImp(this._getUserInformationDataSource);

  @override
  Future<Either<Exception, UserInformationEntity>>
      getUserFirebaseInformation() {
    return _getUserInformationDataSource.call();
  }
}
