import 'dart:async';
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
      print('Добавлено $amount гр кофейных зерен. Теперь: ${_resources.coffeeBeans} гр');
    }
  }

  void addMilk(int amount) {
    if (amount > 0) {
      _resources.milk += amount;
      print('Добавлено $amount мл молока. Теперь: ${_resources.milk} мл');
    }
  }

  void addWater(int amount) {
    if (amount > 0) {
      _resources.water += amount;
      print('Добавлено $amount мл воды. Теперь: ${_resources.water} мл');
    }
  }

  void addCash(int amount) {
    if (amount > 0) {
      _resources.cash += amount;
      print('Внесено $amount руб. В автомате: ${_resources.cash} руб');
    }
  }

  void withdrawCash() {
    if (_resources.cash > 0) {
      print('Изъято ${_resources.cash} руб');
      _resources.cash = 0;
    } else {
      print('В автомате нет денег');
    }
  }

  Future<bool> makeCoffee(String coffeeType) async {
    print('--- Заказ: $coffeeType ---');
    
    try {
      ICoffee coffee = ICoffee.fromType(coffeeType);
      Resources needed = coffee.getResources();
      int price = coffee.getPrice();

      if (!_resources.hasEnough(needed)) {
        print('Недостаточно ресурсов!');
        print('Требуется: $needed');
        print('В наличии: ${_resources}');
        return false;
      }

      if (_resources.cash < price) {
        print('Недостаточно денег! Требуется: $price руб, есть: ${_resources.cash} руб');
        return false;
      }

      await coffee.prepare();
      
      _resources.subtract(needed);
      _resources.cash -= price;
      
      print('Списано $price руб');
      print(coffee.getName() + ' готов!');
      return true;
      
    } catch (e) {
      print('Ошибка: $e');
      print('Доступные виды кофе: эспрессо, капучино, латте, американо');
      return false;
    }
  }

  void showStatus() {
    print('=== СОСТОЯНИЕ КОФЕМАШИНЫ ===');
    print('${_resources}');
    print('==============================');
  }
}