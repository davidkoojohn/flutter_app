import 'package:flutter/material.dart';
import 'package:flutter_app/routes/home.dart';
import 'package:flutter_app/routes/about.dart';
import 'package:flutter_app/routes/tip.dart';
import 'package:flutter_app/routes/counter.dart';

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
      // initialRoute: HomePage.routeName,
      home: const HomePage(title: 'Flutter Demo 首页'),
      routes: {
        TipPage.routeName: (context) => const TipPage(),
        CounterPage.routeName: (context) => CounterPage(),
        // AboutPage.routeName: (context) => AboutPage(),
        // HomePage.routeName: (context) => const HomePage()
      },
      onGenerateRoute: (settings) {
        if(settings.name == AboutPage.routeName) {
          final args = settings.arguments as AboutArguments;
          return MaterialPageRoute(
            builder: (context) {
              return AboutPage(
                text: args.text,
                backgroundColor: args.backgroundColor,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}

