import 'package:flutter/material.dart';
import 'package:flutter_app/routes/home.dart';
import 'package:flutter_app/routes/about.dart';
import 'package:flutter_app/routes/tip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // build()描述如何构建UI界面
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute:"/", //名为"/"的路由作为应用的home(首页)
      routes: {
        TipPage.routeName: (context) => const TipPage(),
        AboutPage.routeName: (context) => AboutPage(),
        HomePage.routeName: (context) => const HomePage(title: 'Flutter Demo 首页')
      },
    );
  }
}

