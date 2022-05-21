import 'package:dartz/dartz.dart';

import '../../models/models.dart';

abstract class GetUserInformationDatasource {
  Future<Either<Exception, UserInformationModel>> getUSerInformation();
}
