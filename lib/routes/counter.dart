import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/counter_widget.dart';

class CounterPage extends StatelessWidget {
  static const routeName = '/counter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('title')
      ),
      body: const CounterWidget(),
    );
  }
}

