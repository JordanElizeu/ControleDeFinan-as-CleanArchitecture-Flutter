import 'package:dartz/dartz.dart';

import '../../models/models.dart';

abstract class GetUserInformationDataSource{
  Future<Either<Exception, UserInformationModel>> call();
}