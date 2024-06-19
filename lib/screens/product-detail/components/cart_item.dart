import 'package:ec_app/components/price.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String productName;
  final int price;
  final String img;

  const CartItem({
    super.key,
    required this.productName,
    required this.price,
    required this.img,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int qty = 1;

  void _handleQty(String type) {
    setState(() {
      if (type == 'increase') {
        qty++;
      } else if (type == 'decrease') {
        if (qty > 1) {
          qty--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Price(price: widget.price),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _handleQty('decrease');
                      },
                      icon: const Icon(Icons.remove),
                      iconSize: 16,
                    ),
                    Text(qty.toString()),
                    IconButton(
                      onPressed: () {
                        _handleQty('increase');
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 16,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
          iconSize: 20,
        ),
      ],
    );
  }
}
