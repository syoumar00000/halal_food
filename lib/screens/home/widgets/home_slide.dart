import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:h_food/models/promotion_model.dart';

class HomeSlide extends StatelessWidget {
  final List<PromotionModel> items;
  const HomeSlide({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2,
        autoPlay: false,
        viewportFraction: 1,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(item.image!),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
