import 'package:flutter/material.dart';

class MathListPage extends StatelessWidget {
  const MathListPage({super.key});

  int _powerOfTwo(int power) {
    int result = 1;
    for (int i = 0; i < power; i++) {
      result *= 2;
    }
    return result;
  }

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
}