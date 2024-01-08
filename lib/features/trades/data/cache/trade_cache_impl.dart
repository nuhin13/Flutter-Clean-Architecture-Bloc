import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/data/cache/base_cache.dart';
import 'package:flutter_clean_architecture/core/data/cache/base_cache_repository.dart';
import 'package:flutter_clean_architecture/features/trades/data/http/trade_http_impl.dart';
import 'package:flutter_clean_architecture/features/trades/domain/model/trade_item.dart';
import 'package:flutter_clean_architecture/features/trades/domain/repo/trade_repository.dart';

class TradeCacheImpl extends BaseCacheRepository implements TradeRepository {
  static const cacheKey = "project:trades";

  final TradeHttpImp _tradeHttpImp;
  TradeCacheImpl(BaseCache cache, this._tradeHttpImp) : super(cache);

  @override
  Future<Either<dynamic, TradeItemList>> getTradeList() async {
    String? value = await cache.get(cacheKey);
    if (value == null) {
      return _getFromSourceAndSave();
    }

    return Right(TradeItemList.fromJson(value));
  }

  Future<Either<dynamic, TradeItemList>> _getFromSourceAndSave() async {
    Either<dynamic, TradeItemList> trades =
        await _tradeHttpImp.getTradeList();

    if (trades.isRight()) {
      TradeItemList? tradeList = trades.fold((l) => null, (r) => r);
      cache.put(cacheKey, tradeList!.toJson(), const Duration(days: 1));
    }

    return trades;
  }
}
