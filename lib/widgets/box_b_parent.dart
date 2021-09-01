import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/box_b.dart';

// 父Widget管理子Widget的状态
class BoxBParent extends StatefulWidget {
  @override
  _BoxBParentState createState() => _BoxBParentState();
}

class _BoxBParentState extends State<BoxBParent> {
  bool _active = false;

  void _handleBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BoxB(
      active: _active,
      onChanged: _handleBoxChanged,
    );
  }
}



