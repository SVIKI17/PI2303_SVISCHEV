import 'package:flutter/material.dart';
import 'pages/simple_list_page.dart';
import 'pages/infinity_list_page.dart';
import 'pages/math_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Списки',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListsHomePage(),
    );
  }
}

class ListsHomePage extends StatefulWidget {
  const ListsHomePage({super.key});

  @override
  State<ListsHomePage> createState() => _ListsHomePageState();
}

class _ListsHomePageState extends State<ListsHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    SimpleListPage(),
    InfinityListPage(),
    MathListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Работа со списками'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Простой',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Бесконечный',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Степени 2',
          ),
        ],
      ),
    );
  }
}