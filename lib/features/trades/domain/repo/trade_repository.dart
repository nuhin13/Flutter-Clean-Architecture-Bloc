import 'package:dartz/dartz.dart';
import '../model/trade_item.dart';


abstract class TradeRepository {
  Future<Either<dynamic, List<TradeItem>>> getTradeList();
}
