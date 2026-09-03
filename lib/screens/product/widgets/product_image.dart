import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/styles/input/favorite_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class ProductImage extends StatelessWidget {
  final ProductsModel product;
  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(product.image!),
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
              child: FavoriteButton(product: product),
            ),
          ),
        ),

        //rate
        /*    Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            alignment: Alignment.center,
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(product.rate.toString()),
          ),
        ), */
      ],
    );
  }
}
