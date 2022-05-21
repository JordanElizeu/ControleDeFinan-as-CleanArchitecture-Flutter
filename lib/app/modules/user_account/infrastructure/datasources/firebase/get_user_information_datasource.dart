import 'package:dartz/dartz.dart';

import '../../model/user_information_model.dart';

abstract class GetUserInformationDataSource{
  Future<Either<Exception, UserInformationModel>> call();
}