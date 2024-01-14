import 'dart:convert';

class TradeItem {
  String? name;
  String? estimateBuyingPrice;
  String? estimateSellingPrice;

  TradeItem(this.name, this.estimateBuyingPrice, this.estimateSellingPrice);

  TradeItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    estimateBuyingPrice = json['estimateBuyingPrice'].toString();
    estimateSellingPrice = json['estimateSellingPrice'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['estimateBuyingPrice'] = estimateBuyingPrice.toString();
    data['estimateSellingPrice'] = estimateSellingPrice.toString();
    return data;
  }
}

class TradeItemList {
  List<TradeItem>? tradeItems;

  TradeItemList({this.tradeItems});

  factory TradeItemList.fromDynamicList(List<dynamic> list) {
    var orders = <TradeItem>[];
    for (var item in list) {
      orders.add(TradeItem.fromJson(item));
    }
    return TradeItemList(tradeItems: orders);
  }

  List<dynamic> toDynamicList() {
    var orders = [];
    for (var item in tradeItems!) {
      orders.add(item.toJson());
    }
    return orders;
  }

  String toJson() {
    return jsonEncode(toDynamicList());
  }

  factory TradeItemList.fromJson(String json) {
    return TradeItemList.fromDynamicList(jsonDecode(json));
  }
}
