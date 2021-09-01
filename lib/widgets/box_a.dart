import 'package:flutter/material.dart';

// Widget管理自身状态
class BoxA extends StatefulWidget {
  @override
  _BoxAState createState() => _BoxAState();
}

class _BoxAState extends State<BoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(
                fontSize: 32.0,
                color: Colors.amber
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightBlue[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
