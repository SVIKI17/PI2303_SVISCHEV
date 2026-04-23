import 'dart:async';
import '../types.dart';
import 'Resources.dart';
import 'ICoffee.dart';

class Machine {
  Resources _resources;

  Machine() : _resources = Resources(
    coffeeBeans: 500,
    milk: 1000,
    water: 2000,
    cash: 0,
  );

  Resources get resources => Resources.copy(_resources);
  int get coffeeBeans => _resources.coffeeBeans;
  int get milk => _resources.milk;
  int get water => _resources.water;
  int get cash => _resources.cash;

  void addCoffeeBeans(int amount) {
    if (amount > 0) {
      _resources.coffeeBeans += amount;
    }
  }

  void addMilk(int amount) {
    if (amount > 0) {
      _resources.milk += amount;
    }
  }

  void addWater(int amount) {
    if (amount > 0) {
      _resources.water += amount;
    }
  }

  void addCash(int amount) {
    if (amount > 0) {
      _resources.cash += amount;
    }
  }

  void withdrawCash() {
    if (_resources.cash > 0) {
      _resources.cash = 0;
    }
  }

  Future<bool> makeCoffee(String coffeeType, StatusCallback onStatusUpdate) async {
    onStatusUpdate('--- Заказ: $coffeeType ---');
    await Future.delayed(Duration(milliseconds: 300));
    
    try {
      ICoffee coffee = ICoffee.fromType(coffeeType);
      Resources needed = coffee.getResources();
      int price = coffee.getPrice();

      if (!_resources.hasEnough(needed)) {
        onStatusUpdate('Недостаточно ресурсов!');
        onStatusUpdate('Требуется: кофе ${needed.coffeeBeans}гр, вода ${needed.water}мл, молоко ${needed.milk}мл');
        onStatusUpdate('В наличии: кофе ${_resources.coffeeBeans}гр, вода ${_resources.water}мл, молоко ${_resources.milk}мл');
        return false;
      }

      if (_resources.cash < price) {
        onStatusUpdate('Недостаточно денег! Требуется: $price руб, есть: ${_resources.cash} руб');
        return false;
      }

      await coffee.prepare(onStatusUpdate);
      
      _resources.subtract(needed);
      _resources.cash -= price;
      
      onStatusUpdate('Списано $price руб');
      onStatusUpdate('Готово! ${coffee.getName()} приготовлен. Приятного аппетита!');
      return true;
      
    } catch (e) {
      onStatusUpdate('Ошибка: $e');
      return false;
    }
  }
}