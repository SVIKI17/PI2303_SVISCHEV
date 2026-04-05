enum CoffeeType {
  espresso('эспрессо', 80, 50, 100, 0),
  cappuccino('капучино', 120, 50, 100, 150),
  latte('латте', 150, 50, 100, 250),
  americano('американо', 100, 40, 150, 0);

  final String ruName;
  final int price;
  final int coffeeBeans;
  final int water;
  final int milk;

  const CoffeeType(this.ruName, this.price, this.coffeeBeans, this.water, this.milk);

  static CoffeeType fromRuName(String name) {
    return CoffeeType.values.firstWhere(
      (type) => type.ruName == name,
      orElse: () => CoffeeType.espresso,
    );
  }
}