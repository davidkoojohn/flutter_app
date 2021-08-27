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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              RandomWordsWidget(),
              Text(args.message),
              RaisedButton(
                // 1. 导航栏返回箭头 (不会返回数据给上一个路由)
                // 2. 页面中的“返回”按钮 (返回数据给上一个路由)
                onPressed: () {
                  // return Navigator.pop(context, "我是“返回”按钮的返回值");
                  Navigator.of(context).pop("我是“返回”按钮的返回值");
                },
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
