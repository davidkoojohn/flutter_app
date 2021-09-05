import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static const routeName = '/list';
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  Widget _buildSuggestions() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _words.length,
      itemBuilder: (BuildContext context, int index) {

        if(_words[index] == loadingTag) {
          if(_words.length - 1 < 100) {
            _retrieveData();

            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }

        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
      // shrinkWrap: true,
    );
    /*return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
      // shrinkWrap: true,
    );*/
    /*return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 100,
      itemExtent: 50,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      // shrinkWrap: true,
    );*/
  }

  Widget divider1 = const Divider(color: Colors.blue);
  Widget divider2 = const Divider(color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('list view'),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text('Random Word List'),
          ),
          Expanded(
            child: _buildSuggestions(),
          )
        ],
      ),
    );
  }
}
