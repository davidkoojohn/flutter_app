import 'package:flutter/material.dart';

class MyDrawerWidget extends StatefulWidget {
  @override
  _MyDrawerWidgetState createState() => _MyDrawerWidgetState();
}

class _MyDrawerWidgetState extends State<MyDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/wbb.jpeg',
                        width: 80.0,
                      ),
                    ),
                  ),
                  const Text('每日一遍冰冰', style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            Expanded(child: ListView(
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Add Account'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Manage Account'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
