import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/entity/instruction.dart';

import '../../../../core/core_export.dart';

abstract class WelcomeRepository {
  Future<bool> isUserLoggedIn();

  Future<Either<Failure, List<Instruction>>> getInstructionData();
}
