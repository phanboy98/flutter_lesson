import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  final int price;
  final double fontSize;
  final Color? color;

  const Price({
    super.key,
    required this.price,
    this.fontSize = 18,
    this.color,
  });

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.price.toStringAsFixed(0).replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => '${m[1]}.',
              ),
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold,
            color: widget.color ?? Colors.orange[600],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'đ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.color ?? Colors.orange[600],
              decoration: TextDecoration.underline,
              decorationColor: widget.color ?? Colors.orange[600],
            ),
          ),
        ),
      ],
    );
  }
}
