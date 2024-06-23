import 'package:ec_app/bloc/cart_bloc.dart';
import 'package:ec_app/bloc/cart_event.dart';
import 'package:ec_app/bloc/cart_state.dart';
import 'package:ec_app/models/cart_item.dart';
import 'package:ec_app/models/product_detail_data.dart';
import 'package:ec_app/screens/product-detail/components/buy_now_button.dart';
import 'package:ec_app/screens/product-detail/components/cart_shortcut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatefulWidget {
  final Future<ProductDetailData> productDetail;
  const BottomNavigation({super.key, required this.productDetail});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
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
                Stack(
                  children: [
                    IconButton(
                      onPressed: () async {
                        cartBloc.add(
                          AddToCartEvent(
                            CartItem(
                              sku: (await widget.productDetail).sku,
                              name: (await widget.productDetail).name,
                              price: (await widget.productDetail).price,
                              img: (await widget.productDetail).img[0],
                              quantity: 1,
                            ),
                          ),
                        );
                        showModalBottomSheet<void>(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return const CartShortcut();
                          },
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.orange[800],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: BlocBuilder<CartBloc, CartState>(
                          bloc: BlocProvider.of<CartBloc>(context),
                          builder: (context, state) => Text(
                            state.qty.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        BuyNowButton(),
      ],
    );
  }
}
