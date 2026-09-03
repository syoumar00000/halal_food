import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  final ProductsModel product;
  final Color? fontColor;
  final Color? iconColor;
  const FavoriteButton({
    super.key,
    required this.product,
    this.fontColor,
    this.iconColor,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero, // Supprime les marges internes par défaut
      constraints:
          const BoxConstraints(), // Supprime les dimensions minimales par défaut de 48x48
      alignment: Alignment.center,
      onPressed: () {
        setState(() {
          Provider.of<FavoriteProvider>(
            context,
            listen: false,
          ).toggle(widget.product);
        });
      },
      color: widget.fontColor,
      iconSize: 20,
      icon: Consumer<FavoriteProvider>(
        builder: (context, favoriteState, child) {
          return Icon(
            !favoriteState.isFavorite(widget.product)
                ? Icons.favorite_border
                : Icons.favorite,
            color: widget.iconColor,
          );
        },
      ),
    );
  }
}
