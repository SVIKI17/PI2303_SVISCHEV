import 'package:flutter/material.dart';
import '../classes/Machine.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Machine _machine;

  @override
  void initState() {
    super.initState();
    _machine = Machine();
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кофемашина'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildResourcesCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildResourcesCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Состояние машины',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildResourceItem('Кофе', _machine.coffeeBeans, 'гр', Colors.brown),
                _buildResourceItem('Вода', _machine.water, 'мл', Colors.blue),
                _buildResourceItem('Молоко', _machine.milk, 'мл', Colors.white70),
                _buildResourceItem('Деньги', _machine.cash, 'руб', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem(String label, int value, String unit, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$value',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Text('$label, $unit'),
      ],
    );
  }
}