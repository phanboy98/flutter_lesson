import 'package:ec_app/screens/checkout/main.dart';
import 'package:flutter/material.dart';

class BuyNowButton extends StatefulWidget {
  String buttonLable;
  BuyNowButton({super.key, this.buttonLable = 'Mua ngay'});

  @override
  State<BuyNowButton> createState() => _BuyNowButtonState();
}

class _BuyNowButtonState extends State<BuyNowButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Checkout(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            widget.buttonLable,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
