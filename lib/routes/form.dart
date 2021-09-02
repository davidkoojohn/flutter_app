import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  static const routeName = '/form';
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试表单'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _unameController,
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  icon: Icon(Icons.person)
                ),
              ),
              TextFormField(
                controller: _pwdController,
                decoration: const InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    icon: Icon(Icons.lock)
                ),
                obscureText: true,
                // validator: ,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text('登录'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          print(_unameController.text);
                          print(_pwdController.text);
                        },
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
