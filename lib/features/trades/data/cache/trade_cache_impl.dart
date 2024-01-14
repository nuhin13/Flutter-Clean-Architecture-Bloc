import 'package:dartz/dartz.dart';

import '../../../../core/core_export.dart';
import '../../domain/entity/trade_item.dart';
import '../../domain/repo/trade_repository.dart';
import '../http/trade_http_impl.dart';

class TradeCacheImpl extends BaseCacheRepository implements TradeRepository {
  static const cacheKey = "project:trades";

  final TradeHttpImp _tradeHttpImp;

  TradeCacheImpl(BaseCache cache, this._tradeHttpImp) : super(cache);

  @override
  Future<Either<Failure, TradeItemList>> getTradeList() async {
    String? value = await cache.get(cacheKey);
    if (value == null) {
      return _getFromSourceAndSave();
    }

    return Right(TradeItemList.fromJson(value));
  }

  Future<Either<Failure, TradeItemList>> _getFromSourceAndSave() async {
    Either<Failure, TradeItemList> trades = await _tradeHttpImp.getTradeList();

    if (trades.isRight()) {
      TradeItemList? tradeList = trades.fold((l) => null, (r) => r);
      cache.put(cacheKey, tradeList!.toJson(), const Duration(days: 1));
    }

    return trades;
  }
}
