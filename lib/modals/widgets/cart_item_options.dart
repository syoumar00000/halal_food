import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/styles/spacing_style.dart';

class CartItemOptions extends StatelessWidget {
  final List<PriceItem> prices;
  final void Function(String?, [bool]) onChanged;
  final PriceItem currentValue;
  final OptionItem option;

  const CartItemOptions({
    super.key,
    required this.prices,
    required this.onChanged,
    required this.currentValue,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    // Récupération de la valeur actuellement sélectionnée pour le groupe Radio
    final String? selectedRadioValue = option.selected!.isNotEmpty
        ? option.selected![0]
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(option.title!, style: Theme.of(context).textTheme.titleLarge),

        // ─── OPTION SÉLECTION UNIQUE (RADIO) AVEC RADIOGROUP ───
        if (option.multiple == false)
          RadioGroup<String>(
            groupValue: selectedRadioValue,
            onChanged: (String? value) => onChanged(value),
            child: Column(
              children: option.values!
                  .map(
                    (e) => RadioListTile<String>(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      value: e,
                      title: Text(
                        e,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Note : groupValue et onChanged ont été retirés d'ici !
                    ),
                  )
                  .toList(),
            ),
          ),

        // ─── OPTION SÉLECTIONS MULTIPLES (CHECKBOX) ───
        if (option.multiple == true)
          ...option.values!.map(
            (e) => CheckboxListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              value: option.selected!.contains(e),
              title: Text(
                e,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onChanged: (bool? selected) => onChanged(e, selected!),
            ),
          ),

        KSpaceH(0.5),
        const Divider(),
        KSpaceH(0.5),
      ],
    );
  }
}

// ─── COMPOSANT SÉLECTION DE PRIX (RADIO) AVEC RADIOGROUP ───
class CartItemPriceOptions extends StatelessWidget {
  final List<PriceItem> prices;
  final Function(PriceItem?) onChanged;
  final PriceItem currentValue;

  const CartItemPriceOptions({
    super.key,
    required this.prices,
    required this.onChanged,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price", style: Theme.of(context).textTheme.titleLarge),

        // Utilisation du RadioGroup autour du mapping de prix
        RadioGroup<PriceItem>(
          groupValue: currentValue,
          onChanged: onChanged,
          child: Column(
            children: prices
                .map(
                  (e) => RadioListTile<PriceItem>(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    value: e,
                    title: Text(
                      "${e.title} - $KCurrency${e.amount.toString()}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Note : groupValue et onChanged ont été retirés d'ici !
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
