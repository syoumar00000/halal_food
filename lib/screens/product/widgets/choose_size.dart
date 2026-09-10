import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/screens/product/widgets/text_onglet.dart';

class ChooseSize extends StatelessWidget {
  final ProductsModel product;
  final int selectedPriceIndex; // Reçoit l'index sélectionné du parent
  final ValueChanged<int>
  onSizeChanged; // Fonction pour notifier le parent du changement

  const ChooseSize({
    super.key,
    required this.product,
    required this.selectedPriceIndex,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextOnglet(label: "Choose Size"),
        const SizedBox(height: 15),
        RadioGroup<int>(
          groupValue:
              selectedPriceIndex, // Utilise la valeur passée par le parent
          onChanged: (int? newIndex) {
            if (newIndex != null) {
              onSizeChanged(newIndex); // Déclenche la fonction du parent
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(product.prices!.length, (index) {
              final bool isSelected = selectedPriceIndex == index;

              return Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xfff45a08).withAlpha(20)
                      : const Color(0xff303030).withAlpha(15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xfff45a08)
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<int>(
                      value: index,
                      activeColor: const Color(0xfff45a08),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${product.prices![index].title}",
                      style: TextStyle(
                        color: isSelected
                            ? const Color(0xfff45a08)
                            : const Color(0xff727272).withAlpha(150),
                        fontSize: 18,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.getFormattedPrice(product.prices![index]),
                      style: TextStyle(
                        color: isSelected
                            ? const Color(0xff303030)
                            : const Color(0xff303030).withAlpha(180),
                        fontSize: 18,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
