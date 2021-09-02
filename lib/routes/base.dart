import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasePage extends StatefulWidget {
  static const routeName = '/base';

  @override
  _BasePageState createState() => _BasePageState();
}

/*
*
* TextField 监听文本变化也有两种方式：
* 1. 设置onChange回调（专门用于监听文本变化），如：
* onChanged: (v) {
    print("onChange: $v");
  }
* 2. 通过controller监听（除了能监听文本变化外，它还可以设置默认值、选择文本），如：
* @override
  void initState() {
    //监听输入改变
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

创建一个controller:
TextEditingController _selectionController =  TextEditingController();
*
* */

class _BasePageState extends State<BasePage> {
  bool _switchSelected = false;
  bool? _checkboxSelected = true;
  TextEditingController _unameController = TextEditingController();
  TextEditingController _selectionController = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    _unameController.addListener((){
      print(_unameController.text);
    });

    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionController.text.length
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础组件'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Divider(),
            TextField(
              autofocus: true,
              focusNode: _focusNode1,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                prefixIcon: Icon(Icons.person),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow)
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
              /*onChanged: (val){
                print("onChange: $val");
              },*/
              controller: _unameController,
            ),
            TextField(
              // autofocus: true,
              focusNode: _focusNode2,
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
            Builder(builder: (ctx){
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('移动焦点'),
                    onPressed: (){
                      //将焦点从第一个TextField移到第二个TextField
                      FocusScope.of(context).requestFocus(_focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: const Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      _focusNode1.unfocus();
                      _focusNode2.unfocus();
                    },
                  ),
                ],
              );
            }),
            const Divider(),
            TextField(
              controller: _selectionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            /*SizedBox(
              height: 5,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            const Divider(),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            const Divider(),
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            const Divider(),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: .7,
            ),*/
            const Divider(),
            Switch(value: _switchSelected, onChanged: (val){
              setState(() {
                _switchSelected = val;
              });
            }),
            Checkbox(value: _checkboxSelected, activeColor: Colors.green, onChanged: (val){
              setState(() {
                _checkboxSelected = val;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.assessment, color: Colors.green),
                Icon(Icons.accessible, color: Colors.green),
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.fingerprint, color: Colors.green),
                Icon(Icons.favorite, color: Colors.green),
                Text('\uE914 \uE000 \uE90D \ue87d',
                  style: TextStyle(
                      fontFamily: 'MaterialIcons',
                      fontSize: 30.0,
                      color: Colors.green
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(16.0),
              child: SizedBox(
                child: Image(image: AssetImage('assets/images/wbb.jpeg'),
                ),
              ),
            ),
            const Image(image: NetworkImage('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
              width: 300.0,
              height: 300.0,
              color: Colors.redAccent,
              colorBlendMode: BlendMode.difference,
              alignment: Alignment.topCenter,
              repeat: ImageRepeat.repeatY,
            ),
            Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
              width: 400.0,
              height: 400.0,
              repeat: ImageRepeat.repeat,
            ),
            const Image(image: AssetImage('assets/images/lyf.webp'),
              width: 400.0,
              height: 400.0,
              fit: BoxFit.cover, // cover, contain, fill, fitHeight, fitWidth
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
