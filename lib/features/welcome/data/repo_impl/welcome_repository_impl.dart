
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/data/http/base_http_repository.dart';

import '../../../../core/data/cache/base_cache.dart';
import '../../../../core/data/cache/preference/shared_preference_constants.dart';
import '../../../../core/domain/failure.dart';
import '../../../../core/domain/service_locator.dart';
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
