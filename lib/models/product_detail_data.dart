class ProductDetailData {
  final String sku;
  final String name;
  final int price;
  final List img;
  final int views;
  final int buyers;
  final int star;
  final String description;
  final String category;
  final String brand;
  final String weight;

  ProductDetailData({
    required this.sku,
    required this.name,
    required this.price,
    required this.img,
    required this.views,
    required this.buyers,
    required this.star,
    required this.description,
    required this.category,
    required this.brand,
    required this.weight,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) {
    return ProductDetailData(
      sku: json['sku'],
      name: json['name'],
      price: json['price'],
      img: json['img'],
      views: json['views'],
      buyers: json['buyers'],
      star: json['star'],
      description: json['description'],
      category: json['category'],
      brand: json['brand'],
      weight: json['weight'],
    );
  }
}
