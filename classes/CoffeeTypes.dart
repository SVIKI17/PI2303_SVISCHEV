import '../enums.dart';
import 'ICoffee.dart';
import 'Resources.dart';

class Espresso implements ICoffee {
  @override
  String getName() => CoffeeType.espresso.ruName;
  @override
  int getPrice() => CoffeeType.espresso.price;
  @override
  Resources getResources() => Resources(
    coffeeBeans: CoffeeType.espresso.coffeeBeans,
    water: CoffeeType.espresso.water,
    milk: CoffeeType.espresso.milk,
  );
}

class Cappuccino implements ICoffee {
  @override
  String getName() => CoffeeType.cappuccino.ruName;
  @override
  int getPrice() => CoffeeType.cappuccino.price;
  @override
  Resources getResources() => Resources(
    coffeeBeans: CoffeeType.cappuccino.coffeeBeans,
    water: CoffeeType.cappuccino.water,
    milk: CoffeeType.cappuccino.milk,
  );
}

class Latte implements ICoffee {
  @override
  String getName() => CoffeeType.latte.ruName;
  @override
  int getPrice() => CoffeeType.latte.price;
  @override
  Resources getResources() => Resources(
    coffeeBeans: CoffeeType.latte.coffeeBeans,
    water: CoffeeType.latte.water,
    milk: CoffeeType.latte.milk,
  );
}

class Americano implements ICoffee {
  @override
  String getName() => CoffeeType.americano.ruName;
  @override
  int getPrice() => CoffeeType.americano.price;
  @override
  Resources getResources() => Resources(
    coffeeBeans: CoffeeType.americano.coffeeBeans,
    water: CoffeeType.americano.water,
    milk: CoffeeType.americano.milk,
  );
}