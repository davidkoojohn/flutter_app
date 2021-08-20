import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('About')
      ),
      body: Center(
        child: const Text(
            "This is My About Page."
        ),
      ),
    );
  }
}
