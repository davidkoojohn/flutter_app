import 'package:flutter/material.dart';

class TipPage extends StatelessWidget {
  const TipPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('text'),
              Text(title),
              RaisedButton(
                // 1. 导航栏返回箭头 (不会返回数据给上一个路由)
                // 2. 页面中的“返回”按钮 (返回数据给上一个路由)
                onPressed: () {
                  // return Navigator.pop(context, "我是“返回”按钮的返回值");
                  return Navigator.of(context).pop("我是“返回”按钮的返回值");
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
