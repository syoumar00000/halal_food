import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/providers/favorite_provider.dart';
import 'package:h_food/screens/home/widgets/image_and_icon_stack.dart';
import 'package:h_food/screens/home/widgets/ingredient_option.dart';
import 'package:h_food/styles/button/button_style.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/styles/text_style.dart';
import 'package:h_food/widgets/navigation/main_bottom_bar.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteState = Provider.of<FavoriteProvider>(context, listen: true);
    final products = favoriteState.items;
    return Scaffold(
      body: products.isNotEmpty
          ? Padding(
              padding: KBodyPadding,
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = products[index].options;
                  final String iconPath =
                      products[index].restaurant?.icon ?? '';
                  // Vérification si le fichier se termine par .svg (insensible à la casse)
                  final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
                  final double cardWidth = KscreenWidth(context);
                  return Container(
                    width: cardWidth,
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xff727272).withAlpha(50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageAndIconStack(
                          width: cardWidth,
                          product: products[index],
                        ),
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
                                  products[index].title!,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                products[index].getFormattedPrice(
                                  products[index].prices![0],
                                ),
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
                                    "${products[index].cookDuration!} mins",
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
                        products[index].options != null &&
                                products[index].options!.isNotEmpty
                            ? IngredientOption(product: products[index])
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            )
          : Container(
              padding: KBodyPadding,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text("No favorite found", style: KHeadline6(context)),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: KBlackButtonStyle,
                      onPressed: () {
                        // Navigator.pushNamed(context, "/category");
                      },
                      child: Text(
                        "Get more items",
                        style: KSubtitle1(context, Colors.white),
                      ),
                    ),
                  ),
                  KSpaceH(1),
                ],
              ),
            ),
      bottomNavigationBar: MainBottomBar(currentIndex: 2),
    );
  }
}
