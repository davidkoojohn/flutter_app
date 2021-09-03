import 'package:flutter/material.dart';
import 'package:flutter_app/routes/base.dart';
import 'package:flutter_app/routes/box.dart';
import 'package:flutter_app/routes/counter.dart';
import 'package:flutter_app/routes/form.dart';
import 'package:flutter_app/routes/layout.dart';
import 'package:flutter_app/routes/tip.dart';
import 'package:flutter_app/routes/about.dart';

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
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _selectedIndex = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[//导航栏右侧菜单
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        ],
        // leading: Image.asset('assets/images/wbb.jpeg', width: 10.0,),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.dashboard, color: Colors.red,),
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        },),
        backgroundColor: Colors.blue,
      ),
      drawer: const Drawer(), // 抽屉
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(onPressed: () {}, icon: const Icon(Icons.home), label: const Text('label')),
            OutlineButton.icon(onPressed: () {}, icon: const Icon(Icons.home), label: const Text('label')),
            FlatButton.icon(onPressed: () {}, icon: const Icon(Icons.home), label: const Text('label')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined)),
            RaisedButton(
              child: const Text('自定义按钮'),
              color: Colors.blue,
              highlightColor: Colors.redAccent[700],
              colorBrightness: Brightness.dark, // 文字为浅色
              // colorBrightness: Brightness.light,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {},
            ),
            const Divider(),
            FlatButton(
                child: const Text('容器类组件'),
                color: Colors.blue[300],
                colorBrightness: Brightness.dark,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                onPressed: () => Navigator.pushNamed(context, BoxPage.routeName)
            ),
            const Divider(),
            FlatButton(
                child: const Text('布局类组件'),
                color: Colors.green,
                colorBrightness: Brightness.dark,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                onPressed: () => Navigator.pushNamed(context, LayoutPage.routeName)
            ),
            const Divider(),
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
            const Divider(),
            FlatButton(
              child: const Text('counter'),
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    CounterPage.routeName,
                );
              },
            ),
            const Divider(),
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
            RaisedButton(
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
      ),
    );
  }
}
