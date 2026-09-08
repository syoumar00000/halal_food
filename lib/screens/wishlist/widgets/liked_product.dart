/* import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/screens/home/widgets/image_and_icon_stack.dart';
import 'package:h_food/screens/home/widgets/ingredient_option.dart';
import 'package:h_food/screens/product/product_screen.dart';
import 'package:h_food/styles/input/favorite_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class LikedProduct extends StatelessWidget {
  final ProductsModel product;
  const LikedProduct({super.key, required this.product});

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
      child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: KscreenWidth(context),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xff727272).withAlpha(50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageAndIconStack(width: KscreenWidth(context), product: product),
                        Transform.translate(
                          offset: const Offset(10, -30),
                          child: Container(
                            width: 60, // Équivalent à un rayon (radius) de 30
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors
                                  .white, // LA SOLUTION : Fond blanc de secours
                              shape: BoxShape
                                  .circle, // Rend le fond parfaitement rond
                              boxShadow: [
                                // Optionnel : une légère ombre pour faire décoller le logo du fond gris de la carte
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            // Le ClipOval reste à l'intérieur pour couper l'image en rond
                            child: ClipOval(
                              child: isSvg
                                  ? SvgPicture.asset(
                                      iconPath,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(iconPath, fit: BoxFit.cover),
                            ),
                          ),
                        ),

                        // SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.title!,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                product.getFormattedPrice(product.prices![0]),
                                style: TextStyle(
                                  color: Color(0xfff45a08),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.motorcycle,
                                    size: 18,
                                    color: Color(0xfff45a08),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "Free Delivery",
                                    style: TextStyle(
                                      color: Color(0xff727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse_rounded,
                                    size: 18,
                                    color: Color(0xfff45a08),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "${product.cookDuration!} mins",
                                    style: TextStyle(
                                      color: Color(0xff727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        // 1. On vérifie si la liste des options n'est pas vide
                        product.options != null && product.options!.isNotEmpty
                            ? IngredientOption(product: product)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
       /* Container(
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
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 20,
                      width: 45,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: FavoriteButton(product: product),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 30,
              child: 
              ),
          ],
        ),
      ), */
    );
  }
}
 */
