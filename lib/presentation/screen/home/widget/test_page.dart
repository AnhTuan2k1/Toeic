import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    super.key,
    required this.fileName,
    required this.part,
    this.title = '',
    this.isDownloaded = false,
    this.numQuestion,
  });

  final String fileName;
  final String title;
  final String part;
  final bool isDownloaded;
  final int? numQuestion;

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
