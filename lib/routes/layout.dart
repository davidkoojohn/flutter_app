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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
*
* 沿水平 或 垂直方向 排布子组件 => Row和Column来实现线性布局 => 有主轴和纵轴之分
* 在线性布局中，有两个定义对齐方式的枚举类 MainAxisAlignment 和 CrossAxisAlignment，分别代表主轴对齐和纵轴对齐
*
* Row可以在水平方向排列其子widget
* - textDirection：表示水平方向子组件的布局顺序
* - mainAxisSize: 表示Row在主轴(水平)方向占用的空间
* - verticalDirection: 表示Row纵轴（垂直）的对齐方向
* *
* - mainAxisAlignment: 表示子组件在Row所占用的水平空间内对齐方式
* - crossAxisAlignment：表示子组件在纵轴方向的对齐方式
* */

