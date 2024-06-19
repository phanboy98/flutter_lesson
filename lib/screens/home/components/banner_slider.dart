import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    super.key,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  List<String> images = [
    "assets/images/banner_slider1.png",
    "assets/images/banner_slider2.png",
    "assets/images/banner_slider3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
