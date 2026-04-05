import 'CoffeeTypes.dart';
import 'Resources.dart';

abstract class ICoffee {
  factory ICoffee.fromType(String type) {
    switch (type.toLowerCase()) {
      case 'эспрессо':
        return Espresso();
      case 'капучино':
        return Cappuccino();
      case 'латте':
        return Latte();
      case 'американо':
        return Americano();
      default:
        throw Exception('Неизвестный тип кофе: $type');
    }
  }

  String getName();
  int getPrice();
  Resources getResources();
}