import 'package:flutter/material.dart';

// 混合状态管理
class BoxB extends StatefulWidget {
  BoxB({Key? key, this.active: false, required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _BoxBState createState() => _BoxBState();
}

class _BoxBState extends State<BoxB> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(
                fontSize: 32.0,
                color: Colors.amber
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightBlue[700] : Colors.grey[600],
          border: _highlight ? Border.all(color: Colors.yellow, width: 10.0) : null,
        ),
      ),
    );
  }
}
