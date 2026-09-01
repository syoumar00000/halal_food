import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  final ProductsModel product;
  const FavoriteButton({super.key, required this.product});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          Provider.of<FavoriteProvider>(
            context,
            listen: false,
          ).toggle(widget.product);
        });
      },
      color: Colors.white,
      iconSize: 26,
      icon: Consumer<FavoriteProvider>(
        builder: (context, favoriteState, child) {
          return Icon(
            !favoriteState.isFavorite(widget.product)
                ? Icons.favorite_border
                : Icons.favorite,
            color: favoriteState.isFavorite(widget.product)
                ? Colors.red
                : Colors.white,
          );
        },
      ),
    );
  }
}
