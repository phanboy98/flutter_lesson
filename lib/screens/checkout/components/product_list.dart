import 'package:ec_app/bloc/cart_state.dart';
import 'package:ec_app/screens/product-detail/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ec_app/bloc/cart_bloc.dart';

class CartProductList extends StatefulWidget {
  const CartProductList({super.key});

  @override
  State<CartProductList> createState() => _CartProductListState();
}

class _CartProductListState extends State<CartProductList> {
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
                  Flexible(
                    child: cartState.cart.isNotEmpty
                        ? ListView(
                            padding: const EdgeInsets.all(10),
                            children: cartState.cart
                                .map((item) => CartItem(
                                      sku: item.sku,
                                      productName: item.name,
                                      price: item.price,
                                      img: item.img,
                                      quantity: item.quantity,
                                    ))
                                .toList(),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                    'Không có sản phẩm nào trong giỏ hàng'),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        side: BorderSide(
                                            color: Colors.grey[600]!),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Tiếp tục mua hàng',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
