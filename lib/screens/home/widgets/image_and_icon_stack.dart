import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/styles/input/favorite_button.dart';

class ImageAndIconStack extends StatelessWidget {
  final double width;
  final ProductsModel product;
  const ImageAndIconStack({
    super.key,
    required this.width,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(product.image!, fit: BoxFit.cover),
          ),
        ),

        Positioned(
          top: 12,
          right: 12,
          child: Container(
            height: 32,
            width: 32,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              shape: BoxShape
                  .circle, // Plus propre que BorderRadius.circular(30) sur un carré
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: FavoriteButton(
                product: product,
                fontColor: Color(0xffffffff),
                iconColor: Color(0xfff45a08),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            height: 25,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                SizedBox(width: 2),
                Text(
                  product.rate.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
