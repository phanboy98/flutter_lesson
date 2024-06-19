import 'package:ec_app/components/price.dart';
import 'package:ec_app/screens/product-detail/main.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String sku;
  final String img;
  final String productName;
  final int price;
  final int views;
  final int buyers;
  final int star;

  const ProductItem({
    super.key,
    required this.sku,
    required this.productName,
    required this.price,
    this.img = '',
    this.star = 5,
    this.views = 0,
    this.buyers = 0,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Container(
        height: 255,
        width: 175,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(sku: widget.sku),
              ),
            );
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange[600],
                            size: 16,
                          ),
                          Text('${widget.star} / 5'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Price(price: widget.price),
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                              size: 16,
                            ),
                            Text(widget.buyers.toString()),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
