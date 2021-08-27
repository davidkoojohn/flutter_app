import 'package:flutter/material.dart';
import 'package:flutter_app/routes/tip.dart';
import 'package:flutter_app/routes/about.dart';

/*
* 有状态的组件 Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的;
* 无状态的组件 Stateless widget是不可变的;
*
* Stateful widget至少由两个类组成：
*   1. StatefulWidget类
*   2. State类； StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化。
*
* 为什么要将build方法放在State中，而不是放在StatefulWidget中？
* 主要是为了提高开发的灵活性。如果将build()方法放在StatefulWidget中则会有两个问题：
*   1. 状态访问不便（将build()方法放在State中的话，构建过程不仅可以直接访问状态，而且也无需公开私有状态）
*   2. 继承StatefulWidget不便
*     1）父类内部实现细节，不应该暴露给外部
*     2）父子类之间状态的传递和子类本身逻辑是无关的
* */
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '你可以多次点击这个按钮',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: const Text('to about red'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AboutPage.routeName,
                  arguments: AboutArguments(
                    '首页点击传入的text',
                    Colors.red,
                  )
                );
              },
            ),
            FlatButton(
              child: const Text('to about green'),
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    AboutPage.routeName,
                    arguments: AboutArguments(
                      '首页点击传入的 green text',
                      Colors.green,
                    )
                );
              },
            ),
            FlatButton(
              child: const Text('open tip'),
              onPressed: () async {
                var result = await Navigator.pushNamed(
                    context,
                    TipPage.routeName,
                    arguments: ScreenArguments(
                      'Extract Arguments Screen',
                      'This message is extracted in the build method.',
                    )
                );
                // var result = await Navigator.of(context).pushNamed('tip');
                /*var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const TipPage(
                    title: '来自首页的值',
                  );
                }));*/

                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
