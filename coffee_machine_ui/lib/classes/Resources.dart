class Resources {
  int coffeeBeans;
  int milk;
  int water;
  int cash;

  Resources({
    this.coffeeBeans = 0,
    this.milk = 0,
    this.water = 0,
    this.cash = 0,
  });

  Resources.copy(Resources other)
      : coffeeBeans = other.coffeeBeans,
        milk = other.milk,
        water = other.water,
        cash = other.cash;

  void subtract(Resources other) {
    coffeeBeans -= other.coffeeBeans;
    milk -= other.milk;
    water -= other.water;
    cash -= other.cash;
  }

  void add(Resources other) {
    coffeeBeans += other.coffeeBeans;
    milk += other.milk;
    water += other.water;
    cash += other.cash;
  }

  bool hasEnough(Resources required) {
    return coffeeBeans >= required.coffeeBeans &&
           milk >= required.milk &&
           water >= required.water &&
           cash >= required.cash;
  }

  @override
  String toString() {
    return 'Кофе: $coffeeBeans гр, Молоко: $milk мл, Вода: $water мл, Деньги: $cash руб';
  }
}