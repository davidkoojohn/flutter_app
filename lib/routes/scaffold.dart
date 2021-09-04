import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  static const routeName = '/scaffold';
  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> with TickerProviderStateMixin {
  int _selectedIndex = 1;
  List tabs = ["新闻", "历史", "图片"];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    print('init state');
    print(_tabController);
    _tabController?.addListener((){
      print(_tabController?.index);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('追风少年'),
          actions: <Widget>[//导航栏右侧菜单
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          ],
          // leading: Image.asset('assets/images/wbb.jpeg', width: 10.0,),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.dashboard, color: Colors.red,),
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e,)).toList(),
          ),
          backgroundColor: Colors.blue,
        ),
        drawer: const Drawer(), // 抽屉
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),

          onPressed: () {
            print('handle float button');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // color: Colors.blue,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
              const SizedBox(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.business)),
            ],
          ),
        ),
        /*
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),*/
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) { //创建3个Tab页
            return Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 5),
            );
          }).toList(),
        )
    );
  }
}
