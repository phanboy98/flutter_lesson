import 'package:ec_app/bloc/cart_bloc.dart';
import 'package:ec_app/bloc/cart_event.dart';
import 'package:ec_app/components/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatefulWidget {
  final String sku;
  final String productName;
  final int price;
  final String img;
  final int quantity;

  const CartItem({
    super.key,
    required this.sku,
    required this.productName,
    required this.price,
    required this.img,
    required this.quantity,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  void _handleQty(String type) {
    setState(() {
      if (type == 'increase') {
        quantity++;
      } else if (type == 'decrease') {
        if (quantity > 1) {
          quantity--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
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
                      Text(quantity.toString()),
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
            onPressed: () {
              final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
              cartBloc.add(RemoveFromCartEvent(widget.sku));
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}
