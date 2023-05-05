import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/category/category_page.dart';
import 'package:toeic/presentation/screen/grammar/grammar_page.dart';
import 'package:toeic/presentation/screen/home/home_page.dart';
import 'package:toeic/presentation/screen/vocabulary/vocabulary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //const HomePage(),
      const MainForm(),
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MainForm(),
//     );
//   }
// }

class MainForm extends StatefulWidget {
  const MainForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  int _currentIndex = 0;
  final pages = [HomePage(), VocabularyPage(), GrammarPage(), CategoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Vocabulary',
            icon: Icon(Icons.menu_book),
          ),
          BottomNavigationBarItem(
            label: 'Grammar',
            icon: Icon(Icons.history_edu),
          ),
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
        ],
      ),
    );
  }
}



