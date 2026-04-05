import 'ICoffee.dart';
import 'Resources.dart';

class Espresso implements ICoffee {
  @override
  String getName() => 'Эспрессо';

  @override
  int getPrice() => 80;

  @override
  Resources getResources() {
    return Resources(
      coffeeBeans: 50,
      water: 100,
      milk: 0,
      cash: 0,
    );
  }
}

class Cappuccino implements ICoffee {
  @override
  String getName() => 'Капучино';

  @override
  int getPrice() => 120;

  @override
  Resources getResources() {
    return Resources(
      coffeeBeans: 50,
      water: 100,
      milk: 150,
      cash: 0,
    );
  }
}

class Latte implements ICoffee {
  @override
  String getName() => 'Латте';

  @override
  int getPrice() => 150;

  @override
  Resources getResources() {
    return Resources(
      coffeeBeans: 50,
      water: 100,
      milk: 250,
      cash: 0,
    );
  }
}

class Americano implements ICoffee {
  @override
  String getName() => 'Американо';

  @override
  int getPrice() => 100;

  @override
  Resources getResources() {
    return Resources(
      coffeeBeans: 40,
      water: 150,
      milk: 0,
      cash: 0,
    );
  }
}