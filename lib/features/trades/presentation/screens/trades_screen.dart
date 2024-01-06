
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/res/app_context_extension.dart';
import 'package:flutter_svg/svg.dart';

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


  // widget that populate 10 items in list view
  Widget _listView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Column(
            children: [
              Text('Item $index'),
              const SizedBox(height: 10,)
            ],
          ),
        );
      },
    );
  }

}
