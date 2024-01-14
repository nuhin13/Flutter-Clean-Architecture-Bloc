
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/trade_item.dart';
import '../bloc/trades_bloc.dart';
import '../widget/build_trade_item.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TradesBloc>().add(const FetchTrades());

    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<TradesBloc, TradesState>(
          listener: (context, state) {
            if (state is TradesError) {
              // Show error message
            }
          },
          builder: (context, state) {
            if (state is TradesLoading) {
              return const CircularProgressIndicator();
            } else if (state is TradesLoaded) {
              return _listView(state.trades);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _listView(List<TradeItem> tradeItems) {
    // List<TradeItem> tradeItems = generateTradeItems();
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

  /*List<TradeItem> generateTradeItems() {
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
  }*/
}

