import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../../core/core_export.dart';
import '../../domain/entity/trade_item.dart';
import '../../domain/repo/trade_repository.dart';
import '../model/item_list_response.dart';

class TradeHttpImp extends BaseHttpRepository implements TradeRepository {
  late final ApiClient _client;
  late final TradeApiUrls _urls;

  TradeHttpImp(this._client, this._urls) : super(_client);

  @override
  Future<Either<Failure, TradeItemList>> getTradeList() async {
    try {
      final response = await _client.authorizedGet(_urls.getAllTrade);
      if (response.messageCode == 200) {
        ItemListResponse itemList =
            ItemListResponse.fromJson(response.response);

        List<TradeItem> list = [];
        for (var item in itemList.data!) {
          list.add(TradeItem(
            item.name,
            item.estimateBuyingPrice,
            item.estimateSellingingPrice,
          ));

          Logger().i(item.name);
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
