import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro';
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Intro Widget'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Image.asset('assets/images/todaybing.jpg'),
          Padding(padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kandersteg, Switzerland',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '1625 Main Street'*10,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('My City, CA 99984'),
                  leading: Icon(
                    Icons.restaurant_menu,
                    color: Colors.blue[500],
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    '(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.blue[500],
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('costa@example.com'),
                  leading: Icon(
                    Icons.contact_mail,
                    color: Colors.blue[500],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: const Alignment(0, 0.3),
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/wbb.jpeg'),
                radius: 100,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: const Text(
                  '冰冰棒',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

