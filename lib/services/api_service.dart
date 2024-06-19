import 'dart:convert';
import 'package:ec_app/api_config.dart';
import 'package:ec_app/models/product_item_data.dart';
import 'package:ec_app/models/product_detail_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ProductDetailData> getProductDetail(String sku) async {
    final response =
        await http.get(Uri.parse('${ApiConfig.PRODUCT_DETAIL}/$sku'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return ProductDetailData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }

  Future<List<ProductItemData>> getProducts() async {
    final response = await http.get(Uri.parse(ApiConfig.PRODUCT_LIST_ENDPOINT));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ProductItemData.fromJson(item)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductItemData>> getFlashSales() async {
    final response = await http.get(Uri.parse(ApiConfig.FLASH_SALES_ENDPOINT));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ProductItemData.fromJson(item)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }
}
