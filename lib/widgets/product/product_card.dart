import 'package:flutter/material.dart';
import 'package:h_food/modals/cart_product_modal/cart_item_modal.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/screens/product/product_screen.dart';
import 'package:h_food/utils/add_to_cart_toast.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigator.push to productscreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          ),
        );
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff727272).withAlpha(25),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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

                /*    Align(
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
                ), */
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title!,
                style: TextStyle(
                  color: Color(0xff303030),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "${product.calories} EGP",
                    style: TextStyle(
                      color: Color(0xfff45a08),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      // add to cart from provider
                      final cartState = Provider.of<CartProvider>(
                        context,
                        listen: false,
                      );
                      final CartItemModel cartItem =
                          cartState.findCartItem(product) ??
                          CartItemModel(
                            product: product,
                            selectedPrice: product.prices![0],
                            quantity: 1,
                          );
                      cartState.setTempCartItem(cartItem);
                      //show cart item dialog
                      final result = await showCartItem(context, preview: true);
                      //show added to cart toast
                      if (result == true) {
                        addToCartAlert(context, cartItem.product.title!);
                      }
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color(0xfff45a08),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
