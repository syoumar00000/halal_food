import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/screens/product/widgets/choose_size.dart';
import 'package:h_food/screens/product/widgets/product_image.dart';
import 'package:h_food/screens/product/widgets/product_info.dart';
import 'package:h_food/screens/product/widgets/text_onglet.dart';

class ProductScreen extends StatefulWidget {
  final ProductsModel product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image avec leftbutton and heartbutton
            ProductImage(product: widget.product),
            //container above the image
            Transform.translate(
              offset: Offset(0, -35),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0xffffffff,
                  ), // Fond blanc ou une autre couleur propre
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 10,
                      offset: const Offset(
                        0,
                        -5,
                      ), // Ombre vers le haut pour accentuer l'effet
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 15,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff303030).withAlpha(25),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    //restaurant,and product info such as description
                    ProductInfo(product: widget.product),
                    // small, medium or large size
                    ChooseSize(product: widget.product),
                    // add ingredient
                    TextOnglet(label: "Add Ingredients"),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
