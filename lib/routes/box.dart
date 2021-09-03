import 'package:flutter/material.dart';


class BoxPage extends StatefulWidget {
  static const routeName = '/box';

  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {

  Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('box'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 100,
                minWidth: 60,
              ),
              // UnconstrainedBox不会对子组件产生任何限制
              // 很少直接使用此组件，但在"去除"多重限制的时候会有帮助
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 100.0, minHeight: 20.0),//子
                  child: redBox,
                ),
              ),
            ),
            // 多个父级ConstrainedBox限制
            // minWidth和minHeight来说，是取父子中相应数值较大的
            // maxWidth和maxHeight来说，是取父子中相应数值较小的
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 100.0,
                maxWidth: 200.0,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200.0,
                  maxWidth: 100.0
                ),
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  child: redBox,
                ),
              ),
            ),
            const Divider(),
            const Divider(),
            // SizedBox用于给子元素指定固定的宽高
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: redBox,
            ),
            const Divider(),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 100.0, height: 100.0),
              child: redBox,
            ),
            const Divider(),
            // ConstrainedBox用于对子组件添加额外的约束
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0,
                // maxHeight: 80.0
              ),
              child: Container(
                height: 5.0,
                child: redBox,
              ),
            ),
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
