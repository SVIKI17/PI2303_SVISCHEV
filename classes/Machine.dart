class Machine {
  int _coffeeBeans = 500;
  int _milk = 1000;        
  int _water = 2000;       
  int _cash = 0;           

  Machine();
  
  void showStatus() {
    print('\n=== СОСТОЯНИЕ КОФЕМАШИНЫ ===');
    print('Кофейные зерна: $_coffeeBeans гр');
    print('Вода: $_water мл');
    print('Молоко: $_milk мл');
    print('Деньги: $_cash руб');
    print('==============================\n');
  }
}