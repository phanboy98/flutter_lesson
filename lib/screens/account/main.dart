import 'package:ec_app/screens/checkout/main.dart';
import 'package:ec_app/screens/home/main.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  static String routeName = "/account";

  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (value) {
          if (value == 0) {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Checkout(),
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
      appBar: AppBar(
        title: const Text('Tài khoản'),
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
            child: const Row(
              children: [
                // avatar
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/0b/7b/7b/0b7b7',
                      scale: 1.0),
                ),
                // list info user
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyễn Văn A',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0987654321',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          //tab view
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(
                      text: 'Đơn hàng',
                      icon: Icon(Icons.shopping_bag),
                    ),
                    Tab(
                      text: 'Yêu thích',
                      icon: Icon(Icons.favorite_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 500,
                  child: const TabBarView(
                    children: [
                      Text('test'),
                      Text('test'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
