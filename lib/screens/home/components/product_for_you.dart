import 'package:ec_app/components/product_item.dart';
import 'package:ec_app/models/product_item_data.dart';
import 'package:ec_app/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductForYou extends StatefulWidget {
  const ProductForYou({
    super.key,
  });

  @override
  State<ProductForYou> createState() => _ProductForYouState();
}

class _ProductForYouState extends State<ProductForYou> {
  Future<List<ProductItemData>> fetchProduct() {
    return ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Sản phẩm dành cho bạn',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        FutureBuilder<List<ProductItemData>>(
          future: fetchProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ProductItemData> productSpecial = snapshot.data!;
              return SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.81,
                  ),
                  shrinkWrap: true,
                  itemCount: productSpecial.length,
                  itemBuilder: (context, index) {
                    final product = productSpecial[index];
                    return ProductItem(
                      sku: product.sku,
                      productName: product.name,
                      price: product.price,
                      img: product.img,
                      views: product.views,
                      buyers: product.buyers,
                      star: product.star,
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}
