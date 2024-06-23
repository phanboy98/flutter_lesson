import 'package:ec_app/screens/order_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ec_app/bloc/cart_bloc.dart';
import 'package:ec_app/bloc/cart_state.dart';
import 'package:ec_app/components/price.dart';
import 'package:ec_app/screens/checkout/components/product_list.dart';

class Checkout extends StatefulWidget {
  static String routeName = "/checkout";

  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedPaymentMethod = 'Cash on Delivery';
  List<String> paymentMethods = [
    'Cash on Delivery',
    'Credit Card',
    'QR Code',
  ];

  final _formCustomer = GlobalKey<FormState>();
  final _formPaymentMethod = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
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
          Container(
            height: 50,
            color: Colors.grey[100],
            child: const Center(
              child: Text(
                'Thông tin giao hàng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Form(
            key: _formCustomer,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Họ và tên',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Vui lòng nhập họ tên' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Địa chỉ',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Vui lòng nhập địa chỉ' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Vui lòng nhập số điện thoại' : null,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                color: Colors.grey[100],
                child: const Center(
                  child: Text(
                    'Thông tin thanh toán',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              DropdownButton<String>(
                value: selectedPaymentMethod,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
                items: paymentMethods
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              selectedPaymentMethod == 'Credit Card'
                  ? Form(
                      key: _formPaymentMethod,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Card Number',
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Vui lòng nhập số thẻ' : null,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Expiration Date',
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Vui lòng nhập ngày hết hạn'
                                : null,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'CVV',
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Vui lòng nhập CVV' : null,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Container(
            height: 50,
            color: Colors.grey[100],
            child: const Center(
              child: Text(
                'Đơn hàng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formCustomer.currentState!.validate() &&
                          (selectedPaymentMethod != 'Credit Card' ||
                              _formPaymentMethod.currentState!.validate())) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderSuccess(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      'Thanh toán',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
