import 'package:flutter/material.dart';
import 'package:flutter_app/routes/base.dart';
import 'package:flutter_app/routes/box.dart';
import 'package:flutter_app/routes/counter.dart';
import 'package:flutter_app/routes/form.dart';
import 'package:flutter_app/routes/intro.dart';
import 'package:flutter_app/routes/layout.dart';
import 'package:flutter_app/routes/list.dart';
import 'package:flutter_app/routes/moments.dart';
import 'package:flutter_app/routes/scaffold.dart';
import 'package:flutter_app/routes/tip.dart';
import 'package:flutter_app/routes/about.dart';
import 'package:flutter_app/widgets/my_drawer_widget.dart';

/*
* 有状态的组件 Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的;
* 无状态的组件 Stateless widget是不可变的;
*
* Stateful widget至少由两个类组成：
*   1. StatefulWidget类
*   2. State类； StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化。
* */
class HomePage extends StatefulWidget {
  static const routeName = '/';
  final String title;
  const HomePage({Key? key, this.title: 'my app'}) : super(key: key);

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
        actions: <Widget>[//导航栏右侧菜单
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.white,),
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        },)
      ),
      drawer: MyDrawerWidget(), // 抽屉
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[300],
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            const SizedBox(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.business)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // RaisedButton.icon(onPressed: () {}, icon: const Icon(Icons.home), label: const Text('label')),
          OutlineButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, MomentsPage.routeName);
            },
            icon: const Icon(Icons.time_to_leave, color: Colors.blue,),
            label: const Text(
              '车友圈',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          RaisedButton.icon(onPressed: () {
            Navigator.pushNamed(context, IntroPage.routeName);
          }, icon: const Icon(Icons.layers), label: const Text('简单布局')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                Navigator.pushNamed(context, ListPage.routeName);
              }, icon: const Icon(Icons.list_alt_outlined)),
              const Text('基础列表')
            ],
          ),
          RaisedButton(
            child: const Text('tab组件 page'),
            color: Colors.blue,
            highlightColor: Colors.redAccent[700],
            colorBrightness: Brightness.dark, // 文字为浅色
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
            onPressed: () {
              Navigator.pushNamed(context, ScaffoldPage.routeName);
            },
          ),
          FlatButton(
              child: const Text('容器类组件'),
              color: Colors.blue[300],
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              onPressed: () => Navigator.pushNamed(context, BoxPage.routeName)
          ),
          FlatButton(
              child: const Text('布局类组件'),
              color: Colors.green,
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              onPressed: () => Navigator.pushNamed(context, LayoutPage.routeName)
          ),
          RaisedButton(
              child: const Text('Base Widget'),
              onPressed: () => Navigator.pushNamed(context, BasePage.routeName)
          ),
          FlatButton(
              child: const Text('测试表单'),
              color: Colors.green,
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              onPressed: () => Navigator.pushNamed(context, FormPage.routeName)
          ),
          RaisedButton(
            child: const Text('counter'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                CounterPage.routeName,
              );
            },
          ),
          Text.rich(TextSpan(
              children: [
                const TextSpan(text: '你可以多次点击这个按钮：',),
                TextSpan(text: '$_counter',
                  style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 20.0
                  ),
                ),
              ]
          )),
          OutlinedButton(
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
          OutlinedButton(
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
          IconButton(
            icon: const Icon(Icons.privacy_tip),
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
    );
  }
}
