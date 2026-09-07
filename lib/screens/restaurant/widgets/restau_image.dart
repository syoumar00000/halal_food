import 'package:flutter/material.dart';
import 'package:h_food/models/restaurant_model.dart';
import 'package:h_food/styles/input/like_button.dart';

class RestauImage extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestauImage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(restaurant.image!),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfff45a08),
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios_new, color: Color(0xffffffff)),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 30, right: 20),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfff45a08),
              ),
              child: LikeButton(restau: restaurant),
            ),
          ),
        ),
      ],
    );
  }
}
