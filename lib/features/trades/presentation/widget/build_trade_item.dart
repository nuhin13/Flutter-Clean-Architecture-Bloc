import 'package:flutter/material.dart';

import '../../domain/trade_item.dart';

Widget buildItem(TradeItem item) {
  return Card(
    child: ListTile(
      title: Column(
        children: [
          Text("Name:${item.name}"),
          const SizedBox(height: 2),
          Text("Address:${item.address}"),
          const SizedBox(height: 2),
          Text("Contact Person:${item.contactPerson}"),
          const SizedBox(height: 2),
          Text('Contact Phone:${item.phone}'),
        ],
      ),
    ),
  );
}
