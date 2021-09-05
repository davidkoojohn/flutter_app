import 'package:flutter/material.dart';
import 'package:flutter_app/routes/base.dart';
import 'package:flutter_app/routes/box.dart';
import 'package:flutter_app/routes/form.dart';
import 'package:flutter_app/routes/home.dart';
import 'package:flutter_app/routes/about.dart';
import 'package:flutter_app/routes/layout.dart';
import 'package:flutter_app/routes/list.dart';
import 'package:flutter_app/routes/scaffold.dart';
import 'package:flutter_app/routes/tip.dart';
import 'package:flutter_app/routes/counter.dart';
import 'package:google_fonts/google_fonts.dart';

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
        /*
        // 使用google字体
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        )*/
      ),
      // initialRoute: HomePage.routeName,
      home: const HomePage(title: 'Flutter Demo 首页'),
      routes: {
        BasePage.routeName: (context) => BasePage(),
        TipPage.routeName: (context) => const TipPage(),
        CounterPage.routeName: (context) => CounterPage(),
        FormPage.routeName: (context) => FormPage(),
        LayoutPage.routeName: (context) => LayoutPage(),
        BoxPage.routeName: (context) => BoxPage(),
        ScaffoldPage.routeName: (context) => ScaffoldPage(),
        ListPage.routeName: (context) => ListPage(),
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

