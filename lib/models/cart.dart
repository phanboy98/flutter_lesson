class Cart {
  final String sku;
  final String name;
  final int price;
  final int quantity;
  final String img;

  Cart({
    required this.sku,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.img = '',
  });

  updateQuantity(Function(dynamic value) param0) {}
}
