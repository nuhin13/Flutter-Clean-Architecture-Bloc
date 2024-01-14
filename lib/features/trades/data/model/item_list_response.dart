class ItemListResponse {
  ItemListResponse({
    bool? success,
    List<ItemData>? data,
    dynamic errorMessage,
  }) {
    _success = success;
    _data = data;
    _errorMessage = errorMessage;
  }

  ItemListResponse.fromJson(dynamic json) {
    _success = json['Success'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(ItemData.fromJson(v));
      });
    }
    _errorMessage = json['ErrorMessage'];
  }

  bool? _success;
  List<ItemData>? _data;
  dynamic _errorMessage;

  ItemListResponse copyWith({
    bool? success,
    List<ItemData>? data,
    dynamic errorMessage,
  }) =>
      ItemListResponse(
        success: success ?? _success,
        data: data ?? _data,
        errorMessage: errorMessage ?? _errorMessage,
      );

  bool? get success => _success;

  List<ItemData>? get data => _data;

  dynamic get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = _success;
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['ErrorMessage'] = _errorMessage;
    return map;
  }
}

class ItemData {
  ItemData({
    String? name,
    String? estimateBuyingPrice,
    String? estimateSellingingPrice,
  }) {
    _name = name;
    _estimateBuyingPrice = estimateBuyingPrice;
    _estimateSellingingPrice = estimateSellingingPrice;
  }

  ItemData.fromJson(dynamic json) {
    _name = json['Name'];
    _estimateBuyingPrice = json['EstimateBuyingPrice'].toString();
    _estimateSellingingPrice = json['EstimateSellingingPrice'].toString();
  }

  String? _name;
  String? _estimateBuyingPrice;
  String? _estimateSellingingPrice;

  ItemData copyWith(
          {String? name,
          String? estimateBuyingPrice,
          String? estimateSellingingPrice}) =>
      ItemData(
          name: name ?? _name,
          estimateBuyingPrice: estimateBuyingPrice ?? _estimateBuyingPrice,
          estimateSellingingPrice:
              estimateSellingingPrice ?? _estimateSellingingPrice);

  String? get name => _name;

  String? get estimateBuyingPrice => _estimateBuyingPrice;

  String? get estimateSellingingPrice => _estimateSellingingPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['EstimateBuyingPrice'] = _estimateBuyingPrice;
    map['EstimateSellingingPrice'] = _estimateSellingingPrice;
    return map;
  }
}
