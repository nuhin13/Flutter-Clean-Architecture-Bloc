
import 'package:dartz/dartz.dart';

import '../../../../core/core_export.dart';
import '../../domain/entity/instruction.dart';
import '../../domain/repository/welcome_repository.dart';

class WelcomeRepositoryImpl extends BaseHttpRepository implements WelcomeRepository {

  WelcomeRepositoryImpl(super.client);

  @override
  Future<bool> isUserLoggedIn() async {
    String? session = await serviceLocator.get<BaseCache>().get(SharedPreferenceConstant.customerInfo);

    if(session == null) {
      return Future.value(false);
    }

    client.setToken();
    return Future.value(true);
  }

  @override
  Future<Either<Failure, List<Instruction>>> getInstructionData() {
    throw UnimplementedError();
  }
}
