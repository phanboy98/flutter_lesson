import 'package:ec_app/components/product_item.dart';
import 'package:ec_app/models/product_item_data.dart';
import 'package:ec_app/services/api_service.dart';
import 'package:flutter/material.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({
    super.key,
  });

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  Future<List<ProductItemData>> fetchFlashSale() {
    return ApiService().getFlashSales();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Flash Sale',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        FutureBuilder<List<ProductItemData>>(
          future: fetchFlashSale(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ProductItemData> flashSaleProducts = snapshot.data!;
              return SizedBox(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: flashSaleProducts.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      sku: flashSaleProducts[index].sku,
                      productName: flashSaleProducts[index].name,
                      price: flashSaleProducts[index].price,
                      img: flashSaleProducts[index].img,
                      views: flashSaleProducts[index].views,
                      buyers: flashSaleProducts[index].buyers,
                      star: flashSaleProducts[index].star,
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
