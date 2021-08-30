import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/random_words_widget.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class TipPage extends StatelessWidget {
  const TipPage({Key? key}) : super(key: key);

  static const routeName = '/tip';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: RandomWordsWidget(),
      ),
    );
  }
}
