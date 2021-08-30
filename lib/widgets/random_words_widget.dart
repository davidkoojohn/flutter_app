import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/*
* Widget与Element
* 1. Widget实际上就是Element的配置数据，Widget树实际上是一个配置树，而真正的UI渲染树是由Element构成；
* 不过，由于Element是通过Widget生成的，所以它们之间有对应关系，在大多数场景，
* 我们可以宽泛地认为Widget树就是指UI控件树或UI渲染树。
* 2. 一个Widget对象可以对应多个Element对象。这很好理解，根据同一份配置（Widget），可以创建多个实例（Element）
*
* */


class RandomWordsWidget extends StatefulWidget {
  @override
  _RandomWordsWidgetState createState() => _RandomWordsWidgetState();
}

class _RandomWordsWidgetState extends State<RandomWordsWidget> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if(i.isOdd) return const Divider();
        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
      // shrinkWrap: true,
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
