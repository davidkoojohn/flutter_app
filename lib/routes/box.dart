import 'package:flutter/material.dart';


class BoxPage extends StatefulWidget {
  static const routeName = '/box';

  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('box'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
              child: Container(
                height: 100.0,
                color: Colors.amber,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 100.0,
                color: Colors.greenAccent,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100.0,
                color: Colors.greenAccent,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Container(
                height: 100.0,
                color: Colors.greenAccent,
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}

/*
*
* Padding():
* EdgeInsets.fromLTRB(left, top, right, bottom)
* EdgeInsets.all()
* EdgeInsets.only(top: xx) // 具体某个方向的填充
* EdgeInsets.symmetric({ vertical, horizontal }) vertical指top和bottom，horizontal指left和right
*
*
*
* */
