import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue: 0}) : super(key: key);
  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}


class _CounterWidgetState extends State<CounterWidget>{
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _counter = widget.initValue;
    print('init state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('计数器'),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              setState(() {
                // _counter++;
                _counter += 1;
              });
            },
            child: Text("$_counter")
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

/*
* initState()：当Widget第一次插入到Widget树时会被调用
* didChangeDependencies()：当State对象的依赖发生变化时会被调用；
*
* deactivate()：当State对象从树中被移除时，会调用此回调
* dispose()：当State对象从树中被永久移除时调用
*
* reassemble()：专门为了开发调试而提供的，在热重载(hot reload)时会被调用
* didUpdateWidget()：在widget重新构建时

* build()：用于构建Widget子树的
  1. 在调用initState()之后。
  2. 在调用didUpdateWidget()之后。
  3. 在调用setState()之后。
  4. 在调用didChangeDependencies()之后。
  5. 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
* */

