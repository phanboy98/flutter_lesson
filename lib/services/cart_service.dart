import 'dart:convert';
import 'package:ec_app/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String CART_KEY = 'cart';

Future<void> saveCart(List<CartItem> cart) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> cartJson =
      cart.map((item) => json.encode(item.toJson())).toList();
  await prefs.setStringList(CART_KEY, cartJson);
}

Future<List<CartItem>> loadCart() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? cartJson = prefs.getStringList(CART_KEY);
  if (cartJson == null) return [];
  return cartJson.map((item) => CartItem.fromJson(json.decode(item))).toList();
}
