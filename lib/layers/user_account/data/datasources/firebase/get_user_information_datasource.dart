import 'package:controle_financeiro/layers/user_account/data/model/user_information_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetUserInformationDataSource{
  Future<Either<Exception, UserInformationModel>> call();
}