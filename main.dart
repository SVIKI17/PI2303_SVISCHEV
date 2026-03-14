import 'dart:io';
import 'classes/Machine.dart';

void main() {
  Machine machine = Machine();
  
  print('=== КОФЕМАШИНА ===');
  print('Добро пожаловать!');
  
  bool isRunning = true;
  
  while (isRunning) {
    print('\n--- МЕНЮ ---');
    print('1. Показать состояние машины');
    print('2. Добавить кофейные зерна');
    print('3. Добавить воду');
    print('4. Добавить молоко');
    print('5. Внести деньги');
    print('6. Изъять деньги');
    print('7. Заказать эспрессо (80 руб)');
    print('8. Заказать капучино (120 руб)');
    print('9. Заказать латте (150 руб)');
    print('0. Выход');
    stdout.write('Выберите действие: ');
    
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        machine.showStatus();
        break;
        
      case '2':
        stdout.write('Сколько грамм кофе добавить? ');
        int? amount = int.tryParse(stdin.readLineSync() ?? '');
        if (amount != null && amount > 0) {
          machine.addCoffeeBeans(amount);
        } else {
          print('Некорректное значение');
        }
        break;
        
      case '3':
        stdout.write('Сколько мл воды добавить? ');
        int? amount = int.tryParse(stdin.readLineSync() ?? '');
        if (amount != null && amount > 0) {
          machine.addWater(amount);
        } else {
          print('Некорректное значение');
        }
        break;
        
      case '4':
        stdout.write('Сколько мл молока добавить? ');
        int? amount = int.tryParse(stdin.readLineSync() ?? '');
        if (amount != null && amount > 0) {
          machine.addMilk(amount);
        } else {
          print('Некорректное значение');
        }
        break;
        
      case '5':
        stdout.write('Сколько рублей внести? ');
        int? amount = int.tryParse(stdin.readLineSync() ?? '');
        if (amount != null && amount > 0) {
          machine.addCash(amount);
        } else {
          print('Некорректное значение');
        }
        break;
        
      case '6':
        machine.withdrawCash();
        break;
        
      case '7':
        machine.makeCoffee('эспрессо');
        break;
        
      case '8':
        machine.makeCoffee('капучино');
        break;
        
      case '9':
        machine.makeCoffee('латте');
        break;
        
      case '0':
        isRunning = false;
        print('До свидания!');
        break;
        
      default:
        print('Неизвестная команда');
    }
  }
}