class CartItem {
  final String sku;
  final String name;
  final int price;
  final int quantity;
  final String img;

  CartItem({
    required this.sku,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.img = '',
  });

  Map<String, dynamic> toJson() => {
        'sku': sku,
        'name': name,
        'price': price,
        'quantity': quantity,
        'img': img,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        sku: json['sku'],
        name: json['name'],
        price: json['price'],
        quantity: json['quantity'],
        img: json['img'],
      );
}
