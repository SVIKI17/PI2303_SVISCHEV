import 'package:flutter/material.dart';
import '../classes/Machine.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Machine _machine;
  bool _isMakingCoffee = false;
  List<String> _statusMessages = [];

  @override
  void initState() {
    super.initState();
    _machine = Machine();
  }

  void _updateState() {
    setState(() {});
  }

  void _addStatusMessage(String message) {
    setState(() {
      _statusMessages.add(message);
    });
  }

  void _clearStatusMessages() {
    setState(() {
      _statusMessages.clear();
    });
  }

  void _addResource(String type, int amount) {
    switch (type) {
      case 'coffee':
        _machine.addCoffeeBeans(amount);
        break;
      case 'water':
        _machine.addWater(amount);
        break;
      case 'milk':
        _machine.addMilk(amount);
        break;
      case 'cash':
        _machine.addCash(amount);
        break;
    }
    _updateState();
  }

  void _withdrawCash() {
    _machine.withdrawCash();
    _updateState();
  }

  Future<void> _makeCoffee(String type, String name, int price) async {
    if (_isMakingCoffee) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Кофе уже готовится. Подождите.')),
      );
      return;
    }

    _clearStatusMessages();
    
    setState(() {
      _isMakingCoffee = true;
    });

    bool success = await _machine.makeCoffee(type, _addStatusMessage);

    setState(() {
      _isMakingCoffee = false;
    });

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось приготовить $name'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кофемашина'),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildResourcesCard(),
            SizedBox(height: 20),
            _buildControlPanel(),
            SizedBox(height: 20),
            _buildCoffeeMenu(),
            SizedBox(height: 20),
            _buildStatusPanel(),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 5),
        Text(
          '$label, $unit',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildControlPanel() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Управление ресурсами',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildAddButton('Кофе', 'coffee', Colors.brown, 100),
                _buildAddButton('Вода', 'water', Colors.blue, 200),
                _buildAddButton('Молоко', 'milk', Colors.white70, 200),
                _buildAddButton('Деньги', 'cash', Colors.green, 100),
                ElevatedButton.icon(
                  onPressed: _withdrawCash,
                  icon: Icon(Icons.payment, color: Colors.black),
                  label: Text(
                    'Изъять деньги',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(String label, String type, Color color, int amount) {
    return ElevatedButton.icon(
      onPressed: () => _addResource(type, amount),
      icon: Icon(Icons.add, color: Colors.black),
      label: Text(
        '$label +$amount',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
    );
  }

  Widget _buildCoffeeMenu() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Заказать кофе',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildCoffeeButton('Эспрессо', 'эспрессо', 80, Colors.brown),
                _buildCoffeeButton('Капучино', 'капучино', 120, Colors.brown),
                _buildCoffeeButton('Латте', 'латте', 150, Colors.brown),
                _buildCoffeeButton('Американо', 'американо', 100, Colors.brown),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeButton(String name, String type, int price, Color color) {
    return ElevatedButton(
      onPressed: () => _makeCoffee(type, name, price),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            '$price руб',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }

  Widget _buildStatusPanel() {
    if (_statusMessages.isEmpty && !_isMakingCoffee) {
      return SizedBox.shrink();
    }

    return Card(
      elevation: 4,
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Статус приготовления',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                if (_isMakingCoffee) ...[
                  SizedBox(width: 10),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ],
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: _statusMessages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      _statusMessages[index],
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}