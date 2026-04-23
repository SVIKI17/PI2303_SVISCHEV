import 'dart:async';

Future<void> heatWater() async {
  print('[1/4] Начинаем нагрев воды...');
  await Future.delayed(Duration(seconds: 3));
  print('[1/4] Вода нагрета до 90°C');
}

Future<void> brewCoffee() async {
  print('[2/4] Завариваем кофе...');
  await Future.delayed(Duration(seconds: 5));
  print('[2/4] Кофе заварен');
}

Future<void> frothMilk() async {
  print('[3/4] Взбиваем молоко...');
  await Future.delayed(Duration(seconds: 5));
  print('[3/4] Молоко взбито');
}

Future<void> mixCoffeeAndMilk() async {
  print('[4/4] Смешиваем кофе с молоком...');
  await Future.delayed(Duration(seconds: 3));
  print('[4/4] Напиток смешан');
}

Future<void> makeCoffeeWithoutMilk(String coffeeName) async {
  print('Приготовление ' + coffeeName + ':');
  print('----------------------------------------');
  await heatWater();
  await brewCoffee();
  print('----------------------------------------');
  print('Готово! ' + coffeeName + ' приготовлен. Приятного аппетита!');
}

Future<void> makeCoffeeWithMilk(String coffeeName) async {
  print('Приготовление ' + coffeeName + ':');
  print('----------------------------------------');
  
  await heatWater();
  
  print('Запускаем параллельные процессы: заваривание кофе и взбивание молока...');
  await Future.wait([
    brewCoffee(),
    frothMilk(),
  ]);
  
  await mixCoffeeAndMilk();
  
  print('----------------------------------------');
  print('Готово! ' + coffeeName + ' приготовлен. Приятного аппетита!');
}