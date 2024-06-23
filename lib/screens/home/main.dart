import 'package:ec_app/screens/account/main.dart';
import 'package:ec_app/screens/cart/main.dart';
import 'package:ec_app/screens/home/components/flash_sale.dart';
import 'package:ec_app/screens/home/components/product_for_you.dart';
import 'package:flutter/material.dart';

import 'components/categories.dart';
import 'components/banner_slider.dart';
import 'components/home_header.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ),
            );
          }

          if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Account(),
              ),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  BannerSlider(),
                  HomeHeader(),
                ],
              ),
              Categories(),
              SizedBox(height: 20),
              FlashSale(),
              SizedBox(height: 20),
              ProductForYou(),
            ],
          ),
        ),
      ),
    );
  }
}
