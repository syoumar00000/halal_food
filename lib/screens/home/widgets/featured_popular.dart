import 'package:flutter/material.dart';
import 'package:h_food/providers/popular_provider.dart';
import 'package:h_food/screens/home/widgets/image_and_icon_stack.dart';
import 'package:h_food/screens/home/widgets/ingredient_option.dart';
import 'package:h_food/screens/home/widgets/onglet_row.dart';
import 'package:h_food/screens/home/widgets/product_bloc_info.dart';
import 'package:h_food/screens/home/widgets/restaurant_icon_card.dart';
import 'package:h_food/screens/product/product_screen.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

class FeaturedPopular extends StatefulWidget {
  const FeaturedPopular({super.key});

  @override
  State<FeaturedPopular> createState() => _FeaturedPopularState();
}

class _FeaturedPopularState extends State<FeaturedPopular> {
  @override
  void initState() {
    super.initState();
    // CORRECTION 1 : Exécution de getAll() une seule fois au démarrage de l'écran
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PopularProvider>(context, listen: false).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularProvider>(
      builder: (context, popularState, child) {
        final filteredProducts = popularState.items;

        if (filteredProducts.isEmpty) {
          return SizedBox(
            height: KscreenHeight(context) / 2.1,
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xfff45a08)),
            ),
          );
        }

        return SizedBox(
          height: KscreenHeight(context) / 2.5,
          child: Column(
            children: [
              const OngletRow(label: "Popular Now", actionText: "See All"),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    final String iconPath = product.restaurant?.icon ?? '';
                    final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
                    final double cardWidth = KscreenWidth(context) / 1.6;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 4),
                        child: Container(
                          width: cardWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xff727272).withAlpha(50),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageAndIconStack(
                                    width: cardWidth,
                                    product: product,
                                  ),
                                  SizedBox(height: 30),
                                  /*   RestaurantIconCard(
                                  iconPath: iconPath,
                                  isSvg: isSvg,
                                ), */
                                  ProductBlocInfo(
                                    title: product.title!,
                                    price: product.getFormattedPrice(
                                      product.prices![0],
                                    ),
                                    cookDuration:
                                        "${product.cookDuration} mins",
                                  ),
                                  SizedBox(height: 5),
                                  // 1. On vérifie si la liste des options n'est pas vide
                                  product.options != null &&
                                          product.options!.isNotEmpty
                                      ? IngredientOption(product: product)
                                      : const SizedBox(),
                                  const SizedBox(
                                    height: 8,
                                  ), // Petit dégagement sous le texte
                                ],
                              ),
                              Positioned(
                                top: 120,
                                left: 15,
                                child: RestaurantIconCard(
                                  iconPath: iconPath,
                                  isSvg: isSvg,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
