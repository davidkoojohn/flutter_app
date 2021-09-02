import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  static const routeName = '/layout';
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300.0,
            width: 300.0,
            color: Colors.red[100],
            child: const Center(
              // heightFactor: 3,
              // widthFactor: 3,
              child: FlutterLogo(
                size: 100.0,
              ),
            ),
          ),
          Container(
            // height: 300.0,
            // width: 300.0,
            color: Colors.blue[200],
            child: const Align(
              heightFactor: 3,
              widthFactor: 3,
              // alignment: Alignment.bottomRight, // center ....
              // alignment: Alignment(1.5, 0.0), // center ....
              alignment: FractionalOffset(.5, .8), // center ....
              child: FlutterLogo(
                size: 100.0,
              ),
            ),
          ),
          Container(
            height: 400.0,
            width: 400.0,
            color: Colors.greenAccent,
            child: Stack(
              alignment: Alignment.bottomLeft, // 如何去对齐没有定位的子组件 center, bottomLeft, ....
              fit: StackFit.expand, // 没有定位的子组件如何去适应Stack的大小 expand, loose
              // overflow: 超出Stack显示空间的子组件
              // textDirection: TextDirection.rtl,
              children: [
                Container(
                  child: const Text('hello stack', style: TextStyle(color: Colors.white),),
                  color: Colors.redAccent,
                ),
                Container(
                  child: const Text('hello stack', style: TextStyle(color: Colors.white),),
                  color: Colors.redAccent,
                ),
                const Positioned(
                  left: 100.0,
                  top: 100.0,
                  child: Text('樱木花道'),
                ),
                const Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Text('笑傲江湖'),
                )
              ],
            ),
          ),
          Wrap(
            spacing: 10.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center,
            children: const <Widget>[
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text('hello'*100)
              ],
            ),
          ),
          Flex(direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 100.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100.0,
                  color: Colors.greenAccent,
                ),
              )
            ],
          ),
          Padding(padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.amber,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, // end, start
                children: const <Widget>[
                  Text(" hello world ", style: TextStyle(backgroundColor: Colors.redAccent),),
                  Text(" I am John ", style: TextStyle(backgroundColor: Colors.redAccent),),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // start, end, center, spaceAround, spaceBetween
            children: const <Widget>[
              Text(" hello world ", style: TextStyle(backgroundColor: Colors.greenAccent),),
              Text(" I am John ", style: TextStyle(backgroundColor: Colors.greenAccent),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max, // max, min
            children: const <Widget>[
              Text(" hello world ", style: TextStyle(backgroundColor: Colors.greenAccent),),
              Text(" I am John ", style: TextStyle(backgroundColor: Colors.greenAccent),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl, // rtl, ltr
            children: const <Widget>[
              Text(" hello world ", style: TextStyle(backgroundColor: Colors.greenAccent),),
              Text(" I am John ", style: TextStyle(backgroundColor: Colors.greenAccent),),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // start, end, center
            verticalDirection: VerticalDirection.up, // up, down
            children: const <Widget>[
              Text(" hello world ", style: TextStyle(backgroundColor: Colors.greenAccent, fontSize: 30.0),),
              Text(" I am John ", style: TextStyle(backgroundColor: Colors.greenAccent),),
            ],
          )
        ],
      ),
    );
  }
}


/*
*
* Element树才是最终的绘制树，Element树是通过Widget树来创建的（通过Widget.createElement()），
* Widget其实就是Element的配置数据
*
* 根据Widget是否需要包含子节点将Widget分为了三类:
* 1. LeafRenderObjectWidget <=> LeafRenderObjectElement <=>
     Widget树的叶子节点，用于没有子节点的widget，通常基础组件都属于这一类，如Image。
* 2. SingleChildRenderObjectWidget <=> SingleChildRenderObjectWidget <=>
     包含一个子Widget，如：ConstrainedBox、DecoratedBox等
* 3. MultiChildRenderObjectWidget <=> MultiChildRenderObjectElement <=>
     包含多个子Widget，一般都有一个children参数，接受一个Widget数组。如Row、Column、Stack等
*
* StatelessWidget和StatefulWidget就是两个用于组合Widget的基类，它们本身并不关联最终的渲染对象（RenderObjectWidget）
*
* Flex(direction: Axis.horizontal<水平> | Axis.vertical<垂直>) -> Expanded(flex: 2) | Spacer(flex: 1) -> Container()
*
* Row和Column都继承自Flex
*   > Row 水平方向排列其子widget
*   > Column 垂直方向排列其子widget
*
* - textDirection：表示水平方向子组件的布局顺序
* - mainAxisSize: 表示Row在主轴(水平)方向占用的空间
* - verticalDirection: 表示Row纵轴（垂直）的对齐方向
* - mainAxisAlignment: 表示子组件在Row所占用的水平空间内对齐方式
* - crossAxisAlignment：表示子组件在纵轴方向的对齐方式
*
* Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为*流式布局*
* Wrap()：
* - spacing: 10.0, // 主轴(水平)方向间距
* - runSpacing: 4.0, // 纵轴（垂直）方向间距
* - alignment: WrapAlignment.center, // 沿主轴方向排列方式
*
* Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，两个主要区别：
* 1. 定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；
*    而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，
*    最终的偏移是需要通过alignment的转换公式来计算出
* 2. Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。
*
* Center继承自Align，它比Align只少了一个alignment 参数
* Center组件其实是对齐方式确定（Alignment.center）了的Align
*
* */

