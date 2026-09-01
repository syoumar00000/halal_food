import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/product/product_card.dart';

class HomeProducts extends StatelessWidget {
  final String title;
  final List<ProductsModel> products;
  final Function onMorePress;
  const HomeProducts({
    super.key,
    required this.title,
    required this.products,
    required this.onMorePress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("See All", style: TextStyle(color: Color(0xfff45a08))),
            ],
          ),
          KSpaceH(1),
          Expanded(
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // Défilement de gauche à droite ➡️
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return SizedBox(
                  width:
                      160, // 💡 Largeur de chaque burger/plat dans le carrousel
                  child: ProductCard(product: product),
                );
              },
            ),
          ),
          KSpaceH(1),
          Divider(),
        ],
      ),
    );
  }
}
