import 'package:ec_app/components/price.dart';
import 'package:ec_app/models/product_detail_data.dart';
import 'package:ec_app/screens/product-detail/components/bottom_navigation.dart';
import 'package:ec_app/screens/product-detail/components/product-relate.dart';
import 'package:ec_app/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  static String routeName = "/product-detail";
  final String sku;
  const ProductDetail({super.key, required this.sku});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Future<ProductDetailData> fetchProductDetail() async {
    return ApiService().getProductDetail(widget.sku);
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        productDetail: fetchProductDetail(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<ProductDetailData>(
            future: fetchProductDetail(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final product = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 460,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.img.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Image.network(product.img[index]),
                          );
                        },
                      ),
                    ),
                    Price(
                      price: product.price,
                      fontSize: 24,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('SKU: ${product.sku}'),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange[600],
                        ),
                        Text('${product.star} / 5'),
                        const Text(' | '),
                        Text('Đã bán: ${product.buyers}'),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                alignment: Alignment.topRight,
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite_sharp
                                      : Icons.favorite_border,
                                  color: Colors.orange[800],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Chi tiết sản phẩm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category: ${product.category}'),
                          Text('Brand: ${product.brand}'),
                          Text('Weight: ${product.weight}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '⫸Xem thêm⫷',
                                  style: TextStyle(
                                    color: Colors.orange[800],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProductRelate(),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
