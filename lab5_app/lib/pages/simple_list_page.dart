import 'package:flutter/material.dart';

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