import 'package:ec_app/api_config.dart';
import 'package:ec_app/components/product_item.dart';
import 'package:ec_app/models/product_item_data.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductRelate extends StatefulWidget {
  const ProductRelate({
    super.key,
  });

  @override
  State<ProductRelate> createState() => _ProductRelateState();
}

class _ProductRelateState extends State<ProductRelate> {
  Future<List<ProductItemData>> fetchProductRelate() async {
    final response = await http.get(Uri.parse(ApiConfig.FLASH_SALES_ENDPOINT));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ProductItemData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch flash sale');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sản phẩm liên quan',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        FutureBuilder<List<ProductItemData>>(
          future: fetchProductRelate(),
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
