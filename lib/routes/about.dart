import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    this.text: 'default about text',
    this.backgroundColor: Colors.grey,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('About')
      ),
      body: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}
