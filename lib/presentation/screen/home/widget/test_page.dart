import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage(
  {super.key,
  this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: Container(),
    );
  }
}
