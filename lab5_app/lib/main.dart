import 'package:flutter/material.dart';

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

class SimpleListPage extends StatelessWidget {
  const SimpleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.looks_one),
          title: Text('Элемент 1'),
          subtitle: Text('Первый элемент списка'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.looks_two),
          title: Text('Элемент 2'),
          subtitle: Text('Второй элемент списка'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.looks_3),
          title: Text('Элемент 3'),
          subtitle: Text('Третий элемент списка'),
        ),
      ],
    );
  }
}

class InfinityListPage extends StatelessWidget {
  const InfinityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text('Строка номер ${index + 1}'),
          subtitle: Text('Индекс: $index'),
        );
      },
    );
  }
}

class MathListPage extends StatelessWidget {
  const MathListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final power = index + 1;
        final value = _powerOfTwo(power);
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text('$power'),
          ),
          title: Text('2 в степени $power'),
          trailing: Text(
            '$value',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  int _powerOfTwo(int power) {
    int result = 1;
    for (int i = 0; i < power; i++) {
      result *= 2;
    }
    return result;
  }
}