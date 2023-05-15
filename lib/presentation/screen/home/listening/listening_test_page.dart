


import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';

class ListeningTestPage extends TestPage{
  const ListeningTestPage({super.key, this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }

}