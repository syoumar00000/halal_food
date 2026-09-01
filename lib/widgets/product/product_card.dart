import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/styles/input/favorite_button.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigator.push to productscreen
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.asset(product.image!),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 20,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 15),
                        SizedBox(width: 2),
                        Text(
                          product.rate.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FavoriteButton(product: product),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
