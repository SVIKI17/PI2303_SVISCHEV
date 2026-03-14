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

  void showStatus() {
    print('\n=== СОСТОЯНИЕ КОФЕМАШИНЫ ===');
    print('Кофейные зерна: $_coffeeBeans гр');
    print('Вода: $_water мл');
    print('Молоко: $_milk мл');
    print('Деньги: $_cash руб');
    print('==============================\n');
  }
}