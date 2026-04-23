import 'dart:async';
import '../enums.dart';
import '../types.dart';
import 'ICoffee.dart';
import 'Resources.dart';
import '../async_operations.dart';

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
  
  @override
  Future<void> prepare(StatusCallback onStatusUpdate) async {
    await makeCoffeeWithoutMilk(getName(), onStatusUpdate);
  }
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
  
  @override
  Future<void> prepare(StatusCallback onStatusUpdate) async {
    await makeCoffeeWithMilk(getName(), onStatusUpdate);
  }
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
  
  @override
  Future<void> prepare(StatusCallback onStatusUpdate) async {
    await makeCoffeeWithMilk(getName(), onStatusUpdate);
  }
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
  
  @override
  Future<void> prepare(StatusCallback onStatusUpdate) async {
    await makeCoffeeWithoutMilk(getName(), onStatusUpdate);
  }
}