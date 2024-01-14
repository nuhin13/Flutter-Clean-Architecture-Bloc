import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/core_export.dart';

import '../entity/trade_item.dart';

abstract class TradeRepository {
  Future<Either<Failure, TradeItemList>> getTradeList();
}
