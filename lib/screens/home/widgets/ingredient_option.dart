import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';

class IngredientOption extends StatelessWidget {
  final ProductsModel product;
  const IngredientOption({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: product.options!.map((opt) {
          return Container(
            height: 26,
            margin: const EdgeInsets.only(
              right: 8.0,
            ), // Espace entre chaque container
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xffffffff), // Fond blanc
              borderRadius: BorderRadius.circular(
                30,
              ), // Bordures très arrondies (style pilule)
              border: Border.all(
                color: const Color(
                  0xff727272,
                ).withAlpha(40), // Légère bordure grise élégante
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                "${opt.title}", // Affichera "Drink", "Sauce", etc.
                style: const TextStyle(
                  color: Color(0xff727272),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
