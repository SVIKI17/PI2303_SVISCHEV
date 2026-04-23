import 'dart:async';
import 'types.dart';

Future<void> heatWater(StatusCallback onStatusUpdate) async {
  onStatusUpdate('Начинаем нагрев воды...');
  await Future.delayed(Duration(seconds: 3));
  onStatusUpdate('Вода нагрета до 90°C');
}

Future<void> brewCoffee(StatusCallback onStatusUpdate) async {
  onStatusUpdate('Завариваем кофе...');
  await Future.delayed(Duration(seconds: 5));
  onStatusUpdate('Кофе заварен');
}

Future<void> frothMilk(StatusCallback onStatusUpdate) async {
  onStatusUpdate('Взбиваем молоко...');
  await Future.delayed(Duration(seconds: 5));
  onStatusUpdate('Молоко взбито');
}

Future<void> mixCoffeeAndMilk(StatusCallback onStatusUpdate) async {
  onStatusUpdate('Смешиваем кофе с молоком...');
  await Future.delayed(Duration(seconds: 3));
  onStatusUpdate('Напиток смешан');
}

Future<void> makeCoffeeWithoutMilk(String coffeeName, StatusCallback onStatusUpdate) async {
  onStatusUpdate('Приготовление ' + coffeeName + ':');
  await Future.delayed(Duration(milliseconds: 500));
  await heatWater(onStatusUpdate);
  await brewCoffee(onStatusUpdate);
}

Future<void> makeCoffeeWithMilk(String coffeeName, StatusCallback onStatusUpdate) async {
  onStatusUpdate('Приготовление ' + coffeeName + ':');
  await Future.delayed(Duration(milliseconds: 500));
  
  await heatWater(onStatusUpdate);
  
  onStatusUpdate('Запускаем параллельные процессы: заваривание кофе и взбивание молока...');
  await Future.wait([
    brewCoffee(onStatusUpdate),
    frothMilk(onStatusUpdate),
  ]);
  
  await mixCoffeeAndMilk(onStatusUpdate);
}