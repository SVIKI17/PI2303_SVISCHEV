import 'dart:async';
import '../enums.dart';
import 'CoffeeTypes.dart';
import 'Resources.dart';

abstract class ICoffee {
  factory ICoffee.fromType(String type) {
    CoffeeType coffeeType = CoffeeType.fromRuName(type);
    
    switch (coffeeType) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.latte:
        return Latte();
      case CoffeeType.americano:
        return Americano();
    }
  }

  String getName();
  int getPrice();
  Resources getResources();
  Future<void> prepare();
}