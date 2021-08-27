import 'package:flutter/material.dart';

class AboutArguments {
  final String text;
  final Color backgroundColor;

  AboutArguments(this.text, this.backgroundColor);
}

class AboutPage extends StatelessWidget {
  static const routeName = '/about';

  final String text;
  final Color backgroundColor;
  const AboutPage({
    Key? key,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

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
