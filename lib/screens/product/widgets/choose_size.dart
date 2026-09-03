import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/screens/product/widgets/text_onglet.dart';

class ChooseSize extends StatefulWidget {
  final ProductsModel product;
  const ChooseSize({super.key, required this.product});

  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  int value = 1;
  int _selectedPriceIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextOnglet(label: "Choose Size"),
        SizedBox(height: 15),
        RadioGroup<int>(
          groupValue: _selectedPriceIndex,
          onChanged: (int? newIndex) {
            setState(() {
              _selectedPriceIndex = newIndex!;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.product.prices!.length, (index) {
              final bool isSelected = _selectedPriceIndex == index;

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
                    // Le Radio moderne prend simplement sa valeur d'index
                    Radio<int>(
                      value: index,
                      activeColor: const Color(0xfff45a08),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${widget.product.prices![index].title}",
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
                      widget.product.getFormattedPrice(
                        widget.product.prices![index],
                      ),
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
        SizedBox(height: 15),
      ],
    );
  }
}
