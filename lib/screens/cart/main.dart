import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ec_app/bloc/cart_bloc.dart';
import 'package:ec_app/bloc/cart_state.dart';
import 'package:ec_app/components/price.dart';
import 'package:ec_app/screens/checkout/components/product_list.dart';
import 'package:ec_app/screens/product-detail/components/buy_now_button.dart';

class Cart extends StatefulWidget {
  static String routeName = "/Cart";

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
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
      body: Column(
        children: [
          const Expanded(
            child: CartProductList(),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.grey[300],
                  child: BlocBuilder<CartBloc, CartState>(
                    bloc: BlocProvider.of<CartBloc>(context),
                    builder: (context, cartState) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tổng: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Price(
                          price: cartState.total,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BuyNowButton(
                buttonLable: 'Thanh toán',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
