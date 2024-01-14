import 'package:dartz/dartz.dart';

import '../../../../core/core_export.dart';
import '../entity/trade_item.dart';
import '../repo/trade_repository.dart';

class TradeUseCase {
  final TradeRepository _tradeRepository;

  TradeUseCase(this._tradeRepository);

  Future<Either<Failure, TradeItemList>> doGetTradeList() async {
    return await _tradeRepository.getTradeList();
  }

  Future<Either<Failure, bool>> doFilterTradeList() {
    throw UnimplementedError();
  }
}
