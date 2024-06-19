import 'package:ec_app/components/price.dart';
import 'package:ec_app/screens/product-detail/components/buy_now_button.dart';
import 'package:ec_app/screens/product-detail/components/cart_item.dart';
import 'package:flutter/material.dart';

class CartShortcut extends StatefulWidget {
  const CartShortcut({super.key});

  @override
  State<CartShortcut> createState() => _CartShortcutState();
}

class _CartShortcutState extends State<CartShortcut> {
  final List<Map<String, dynamic>> cartItems = [];
  final int cartTotal = 10000000;

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void removeFromCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Giỏ hàng',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: cartItems
                      .map((e) => CartItem(
                            productName: e['productName'],
                            price: e['price'],
                            img: e['img'],
                          ))
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Tổng: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Price(
                            price: cartTotal,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const BuyNowButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
