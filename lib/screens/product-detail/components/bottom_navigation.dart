import 'package:ec_app/screens/product-detail/components/buy_now_button.dart';
import 'package:ec_app/screens/product-detail/components/cart_shortcut.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Colors.orange[800],
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const CartShortcut();
                      },
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.orange[800],
                )
              ],
            ),
          ),
        ),
        const BuyNowButton(),
      ],
    );
  }
}
