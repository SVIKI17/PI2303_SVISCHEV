import 'package:flutter/material.dart';

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