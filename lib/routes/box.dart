import 'package:flutter/material.dart';
import 'dart:math' as math;

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
            /*
            * Container()
            *   - alignment
            *   - margin
            *   - padding
            *   - color // 背景色
            *   - decoration: Decoration(), // 背景装饰
            *   - foregroundDecoration, // 前景装饰
            *   - width
            *   - height
            *   - constraints: BoxConstraints(), //容器大小的限制条件
            *   - transform
            * */
            Container(
              margin: const EdgeInsets.only(top: 50.0, left: 120.0),
              padding: const EdgeInsets.all(20.0),
              // width: 200.0,
              // height: 200.0,
              constraints: const BoxConstraints.tightFor(width: 300.0, height: 150.0),
              // color: Colors.orange,
              decoration: const BoxDecoration(
                gradient: RadialGradient( //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: 1
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 14.0
                  )
                ]
              ),
              alignment: Alignment.bottomRight, // center
              // transform: Matrix4.rotationZ(.1),
              child: const Text('Hello Container',
                style: TextStyle(color: Colors.white, fontSize: 20.0, backgroundColor: Colors.green),
              ),
            ),
            const Divider(),
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
                child: Column(
                  children: [
                    Container(
                      width: 400.0,
                      height: 400.0,
                      color: Colors.green,
                      child: const RotatedBox(
                        quarterTurns: 1, // 旋转90度(1/4圈)
                        child: Align(
                          child: Text('hello !!!'),
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      width: 400.0,
                      height: 400.0,
                      color: Colors.green,
                      child: Transform.scale(
                        scale: 5,
                        child: const Align(
                          child: Text('hello !!!'),
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      width: 400.0,
                      height: 400.0,
                      color: Colors.green,
                      child: Transform.rotate(
                        angle: math.pi / 2,
                        child: const Align(
                          child: Text('hello !!!'),
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      width: 400.0,
                      height: 400.0,
                      color: Colors.green,
                      child: Transform.translate(
                        offset: Offset(-10.0, 100.0),
                        child: const Text('hello !!!'),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      height: 100.0,
                      color: Colors.green,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform: Matrix4.skewY(.3),
                        child: Container(
                          color: Colors.deepOrange,
                          child: const Align(
                            child: Text('Transform', style: TextStyle(
                              fontSize: 25.0,
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.red, Colors.orange]),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5.0,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 5.0,
                    offset: Offset(2, -2),
                  )
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
            ),
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
* ConstrainedBox():
* SizedBox():
* UnconstrainedBox():
* DecoratedBox(): 可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等
*   - decoration: BoxDecoration()
*
* Transform.translate()接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离
*   offset: Offset(-20.0, -5.0),
* Transform.rotate可以对子组件进行旋转变换
*   angle:math.pi/2
* Transform.scale()可以对子组件进行缩小或放大
*   scale: 1.5, //放大到1.5倍
* RotatedBox()和Transform.rotate()功能相似可以对子组件进行旋转变换
*
* */
