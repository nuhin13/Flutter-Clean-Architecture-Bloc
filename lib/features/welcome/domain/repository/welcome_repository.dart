import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/domain/error/failure.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/entity/instruction.dart';

abstract class WelcomeRepository {
  Future<bool> isUserLoggedIn();

  Future<Either<Failure, List<Instruction>>> getInstructionData();
}
