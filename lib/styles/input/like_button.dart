import 'package:flutter/material.dart';
import 'package:h_food/models/restaurant_model.dart';
import 'package:provider/provider.dart';
import 'package:h_food/providers/favorite_provider.dart';

class LikeButton extends StatefulWidget {
  final RestaurantModel restau;
  final Color? fontColor;
  final Color? iconColor;

  const LikeButton({
    super.key,
    required this.restau,
    this.fontColor,
    this.iconColor,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteState, child) {
        // CORRECTION : Utilisez une méthode du provider qui vérifie par ID ou par objet,
        // n'utilisez JAMAIS l'index de la liste dans un sous-composant.
        final bool isLiked = favoriteState.isLiked(widget.restau);

        return IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            setState(() {
              Provider.of<FavoriteProvider>(
                context,
                listen: false,
              ).restauToogle(widget.restau);
            });
          },
          color: widget.fontColor,
          iconSize: 20,
          icon: Icon(
            !favoriteState.isLiked(widget.restau)
                ? Icons.favorite_border
                : Icons.favorite,
            color: widget.iconColor,
          ),
        );
      },
    );
  }
}
