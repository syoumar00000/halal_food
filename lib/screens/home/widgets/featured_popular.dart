import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/providers/popular_provider.dart';
import 'package:h_food/styles/input/favorite_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

class FeaturedPopular extends StatefulWidget {
  const FeaturedPopular({super.key});

  @override
  State<FeaturedPopular> createState() => _FeaturedPopularState();
}

class _FeaturedPopularState extends State<FeaturedPopular> {
  @override
  Widget build(BuildContext context) {
    final popularState = Provider.of<PopularProvider>(
      context,
      listen: false,
    ).getAll();

    return Consumer<PopularProvider>(
      builder: (context, popularState, child) {
        final filteredProducts = popularState.items;

        return SizedBox(
          height: KscreenHeight(context) / 3,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // CORRECTION 3 : Activer le défilement fluide car nous sommes en horizontal
            physics: const BouncingScrollPhysics(),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              final String iconPath = product.restaurant?.icon ?? '';
              // Vérification si le fichier se termine par .svg (insensible à la casse)
              final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
              final double cardWidth = KscreenWidth(context) / 1.8;
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: cardWidth,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Color(0xff727272).withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: cardWidth,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              child: Image.asset(
                                product.image!,
                                fit: BoxFit.cover,
                              ),
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
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    product.rate.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          /*   Positioned(
                            bottom: 0,
                            left: 12,
                            child: SizedBox(
                              width: 60, // Équivalent à un rayon (radius) de 30
                              height: 60,
                              child: ClipOval(
                                child: isSvg
                                    ? SvgPicture.asset(
                                        iconPath,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(iconPath, fit: BoxFit.cover),
                              ),
                            ),
                          ), */
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(10, -30),
                        child: SizedBox(
                          width: 60, // Équivalent à un rayon (radius) de 30
                          height: 60,
                          child: ClipOval(
                            child: isSvg
                                ? SvgPicture.asset(iconPath, fit: BoxFit.cover)
                                : Image.asset(iconPath, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
