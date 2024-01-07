import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/domain/service_locator.dart';
import 'package:flutter_clean_architecture/features/trades/data/model/item_list_response.dart';
import 'package:flutter_clean_architecture/features/trades/domain/model/trade_item.dart';

import '../../../../core/data/cache/base_cache.dart';
import '../../../../core/data/http/api_client.dart';
import '../../../../core/data/http/api_urls.dart';
import '../../../../core/domain/failure.dart';
import '../../domain/repo/trade_repository.dart';

class TradeHttpImp extends TradeRepository {
  late ApiClient _client;
  late BaseCache _cache;

  AuthRepositoryImpl() async {
    _client = serviceLocator<ApiClient>();
    _cache = serviceLocator<BaseCache>();
  }
  
  @override
  Future<Either<dynamic, List<TradeItem>>> getTradeList() async {
    try {
      final response = await _client.authorizedGet(ApiUrl.tradeGetAll);
      if (response.messageCode == 200) {
        ItemListResponse authResponse = ItemListResponse.fromJson(response.response);

        return Right([]);
      } else {
        return const Left(ConnectionFailure("response.data['message']"));
      }
    } catch (e) {
      throw Future.error(e);
    }
  }
}
