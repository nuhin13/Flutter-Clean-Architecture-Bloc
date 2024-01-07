
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/trades/domain/trade_item.dart';

import '../widget/build_trade_item.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _listView(),
      ),
    );
  }

  Widget _listView() {
    List<TradeItem> tradeItems = generateTradeItems();
    return ListView.builder(
      itemCount: tradeItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: buildItem(tradeItems[index]),
        );
      },
    );
  }

  List<TradeItem> generateTradeItems() {
    List<TradeItem> tradeItems = List.generate(
      10,
      (index) => TradeItem()
        ..name = 'Bugi'
        ..contactPerson = 'Nuhin'
        ..address = 'This is $index'
        ..email = 'n@h.com'
        ..phone = '0192932834',
    );
    return tradeItems;
  }
}

