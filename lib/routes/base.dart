import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasePage extends StatefulWidget {
  static const routeName = '/base';

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础组件'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const Image(image: NetworkImage('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
              width: 300.0,
            ),
            Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
              width: 300.0,
            ),
            const Image(image: AssetImage('assets/images/l&m.jpg'),
              width: 200.0,
            ),
            Image.asset('assets/images/l&m.jpg',
              width: 200.0,
            ),
            Text('hello widget!',
              textScaleFactor: 3.0,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.lightBlue)
              ),
            ),
            const Divider(),
            const Text('hello widget!', textAlign: TextAlign.left, style: TextStyle(backgroundColor: Colors.yellow),),
            const Divider(),
            Text('base widget!'*6, overflow: TextOverflow.ellipsis, style: TextStyle(backgroundColor: Colors.yellow),),
            const Divider(),
            Text('base widget!'*6, textAlign: TextAlign.right, style: TextStyle(backgroundColor: Colors.yellow),),
            const Divider(),
            const Text('base widget!', textScaleFactor: 1.5, style: TextStyle(backgroundColor: Colors.yellow),),
            const Divider(),
            Text('base widget!'*10, textScaleFactor: 1.5, maxLines: 3, overflow: TextOverflow.fade, style: TextStyle(backgroundColor: Colors.yellow),),
            const Divider(),
            const Text('base widget!',
              textScaleFactor: 2.0,
              style: TextStyle(
                backgroundColor: Colors.yellow,
                fontSize: 20.0,
                height: 1.4,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dotted
              ),
            ),
            const Text.rich(TextSpan(
              children: [
                TextSpan(text: '昵称: '),
                TextSpan(text: '@追风少年',
                  style: TextStyle(
                    color: Colors.red
                  )
                ),
              ]
            )),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: const TextStyle(
                color:Colors.teal,
                fontSize: 20.0,
              ),
              child: Column(
                children: const <Widget>[
                  Text('有一个人前来买瓜'),
                  Text('有一个人前来买瓜',
                    style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                    ),
                  ),
                  Text('有一个人前来买瓜',
                    style: TextStyle(
                      color: Colors.lightBlue
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
