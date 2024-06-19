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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
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
