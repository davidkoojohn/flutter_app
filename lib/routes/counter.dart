import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/box_b_parent.dart';
import 'package:flutter_app/widgets/counter_widget.dart';
import 'package:flutter_app/widgets/box_a.dart';

class CounterPage extends StatelessWidget {
  static const routeName = '/counter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('title')
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const CounterWidget(),
            const Divider(),
            // Widget管理自身状态
            BoxA(),
            const Divider(),
            // 父Widget管理子Widget的状态
            BoxBParent()
          ],
        ),
      ),
    );
  }
}

