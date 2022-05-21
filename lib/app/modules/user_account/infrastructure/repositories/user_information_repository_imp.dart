import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class UserInformationRepositoryImp implements UserInformationRepository {
  final GetUserInformationDatasource _getUserInformationDataSource;

  UserInformationRepositoryImp(this._getUserInformationDataSource);

  @override
  Future<Either<Exception, UserInformationEntity>>
      getUserFirebaseInformation() {
    return _getUserInformationDataSource.getUSerInformation();
  }
}
