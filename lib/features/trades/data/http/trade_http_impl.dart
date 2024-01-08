import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/data/http/base_http_repository.dart';
import 'package:flutter_clean_architecture/core/domain/service_locator.dart';
import 'package:flutter_clean_architecture/features/trades/data/model/item_list_response.dart';
import 'package:flutter_clean_architecture/features/trades/domain/model/trade_item.dart';

import '../../../../core/data/cache/base_cache.dart';
import '../../../../core/data/http/api_client.dart';
import '../../../../core/data/http/api_urls.dart';
import '../../../../core/domain/failure.dart';
import '../../domain/repo/trade_repository.dart';

class TradeHttpImp extends BaseHttpRepository implements TradeRepository {
  late ApiClient _client;

  TradeHttpImp(this._client) : super(_client);
  
  @override
  Future<Either<dynamic, TradeItemList>> getTradeList() async {
    try {
      final response = await _client.authorizedGet(ApiUrl.tradeGetAll);
      if (response.messageCode == 200) {
        ItemListResponse authResponse = ItemListResponse.fromJson(response.response);

        List<TradeItem> list = [];
         for (var item in authResponse.data!) {
           list.add(TradeItem(
             item.name,
             item.estimateBuyingPrice,
             item.estimateSellingingPrice,
           ));

           print(item.name);
         }

        return Right(TradeItemList(tradeItems: list));
      } else {
        return const Left(ConnectionFailure("response.data['message']"));
      }
    } catch (e) {
      throw Future.error(e);
    }
  }
}
