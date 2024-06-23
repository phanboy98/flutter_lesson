import 'package:ec_app/bloc/cart_state.dart';
import 'package:ec_app/components/price.dart';
import 'package:ec_app/screens/product-detail/components/buy_now_button.dart';
import 'package:ec_app/screens/product-detail/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ec_app/bloc/cart_bloc.dart';

class CartShortcut extends StatefulWidget {
  const CartShortcut({super.key});

  @override
  State<CartShortcut> createState() => _CartShortcutState();
}

class _CartShortcutState extends State<CartShortcut> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (context, cartState) {
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
                          children: cartState.cart
                              .map((item) => CartItem(
                                    sku: item.sku,
                                    productName: item.name,
                                    price: item.price,
                                    img: item.img,
                                    quantity: item.quantity,
                                  ))
                              .toList())),
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
                                price: cartState.total,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                      BuyNowButton()
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
