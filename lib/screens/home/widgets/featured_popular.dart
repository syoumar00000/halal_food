import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/providers/popular_provider.dart';
import 'package:h_food/screens/home/widgets/image_and_icon_stack.dart';
import 'package:h_food/screens/home/widgets/ingredient_option.dart';
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
  Widget build(BuildContext context) {
    final popularState = Provider.of<PopularProvider>(
      context,
      listen: false,
    ).getAll();

    return Consumer<PopularProvider>(
      builder: (context, popularState, child) {
        final filteredProducts = popularState.items;

        return SizedBox(
          height: KscreenHeight(context) / 2.5,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // CORRECTION 3 : Activer le défilement fluide car nous sommes en horizontal
            physics: const BouncingScrollPhysics(),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              final option = product.options;
              final String iconPath = product.restaurant?.icon ?? '';
              // Vérification si le fichier se termine par .svg (insensible à la casse)
              final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
              final double cardWidth = KscreenWidth(context) / 1.6;
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                        ImageAndIconStack(width: cardWidth, product: product),
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
              );
            },
          ),
        );
      },
    );
  }
}
