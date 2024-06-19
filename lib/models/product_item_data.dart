class ProductItemData {
  final String sku;
  final String name;
  final int price;
  final String img;
  final int views;
  final int buyers;
  final int star;

  ProductItemData({
    required this.sku,
    required this.name,
    required this.price,
    required this.img,
    required this.views,
    required this.buyers,
    required this.star,
  });

  factory ProductItemData.fromJson(Map<String, dynamic> json) {
    return ProductItemData(
      sku: json['sku'],
      name: json['name'],
      price: json['price'],
      img: json['img'],
      views: json['views'],
      buyers: json['buyers'],
      star: json['star'],
    );
  }
}
