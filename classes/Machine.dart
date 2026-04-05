class Machine {
  int _coffeeBeans = 500;
  int _milk = 1000;
  int _water = 2000;
  int _cash = 0;

  Machine();

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  int get cash => _cash;

  void addCoffeeBeans(int amount) {
    if (amount > 0) {
      _coffeeBeans += amount;
      print('Добавлено $amount гр кофейных зерен. Теперь: $_coffeeBeans гр');
    }
  }

  void addMilk(int amount) {
    if (amount > 0) {
      _milk += amount;
      print('Добавлено $amount мл молока. Теперь: $_milk мл');
    }
  }

  void addWater(int amount) {
    if (amount > 0) {
      _water += amount;
      print('Добавлено $amount мл воды. Теперь: $_water мл');
    }
  }

  void addCash(int amount) {
    if (amount > 0) {
      _cash += amount;
      print('Внесено $amount руб. В автомате: $_cash руб');
    }
  }

  void withdrawCash() {
    if (_cash > 0) {
      print('Изъято $_cash руб');
      _cash = 0;
    } else {
      print('В автомате нет денег');
    }
  }

  bool _isAvailable(int neededCoffee, int neededWater, int neededMilk) {
    if (_coffeeBeans < neededCoffee) {
      print('Недостаточно кофейных зерен! Требуется: $neededCoffee гр, есть: $_coffeeBeans гр');
      return false;
    }
    if (_water < neededWater) {
      print('Недостаточно воды! Требуется: $neededWater мл, есть: $_water мл');
      return false;
    }
    if (neededMilk > 0 && _milk < neededMilk) {
      print('Недостаточно молока! Требуется: $neededMilk мл, есть: $_milk мл');
      return false;
    }
    return true;
  }

  void _subtractResources(int coffeeAmount, int waterAmount, int milkAmount) {
    _coffeeBeans -= coffeeAmount;
    _water -= waterAmount;
    if (milkAmount > 0) {
      _milk -= milkAmount;
    }
    print('Ресурсы использованы: кофе -$coffeeAmount гр, вода -$waterAmount мл${milkAmount > 0 ? ', молоко -$milkAmount мл' : ''}');
  }

  bool makeCoffee(String coffeeType) {
    print('\n--- Заказ: $coffeeType ---');
    
    int neededCoffee = 0;
    int neededWater = 0;
    int neededMilk = 0;
    int price = 0;

    switch (coffeeType.toLowerCase()) {
      case 'эспрессо':
        neededCoffee = 50;
        neededWater = 100;
        price = 80;
        break;
      case 'капучино':
        neededCoffee = 50;
        neededWater = 100;
        neededMilk = 150;
        price = 120;
        break;
      case 'латте':
        neededCoffee = 50;
        neededWater = 100;
        neededMilk = 250;
        price = 150;
        break;
      default:
        print('Неизвестный тип кофе. Доступно: эспрессо, капучино, латте');
        return false;
    }

    if (!_isAvailable(neededCoffee, neededWater, neededMilk)) {
      return false;
    }

    if (_cash < price) {
      print('Недостаточно денег! Требуется: $price руб, есть: $_cash руб');
      return false;
    }

    print('Готовим $coffeeType...');
    _subtractResources(neededCoffee, neededWater, neededMilk);
    _cash -= price;
    
    print('$coffeeType готов! Списано $price руб');
    return true;
  }

  void showStatus() {
    print('\n=== СОСТОЯНИЕ КОФЕМАШИНЫ ===');
    print('Кофейные зерна: $_coffeeBeans гр');
    print('Вода: $_water мл');
    print('Молоко: $_milk мл');
    print('Деньги: $_cash руб');
    print('==============================\n');
  }
}