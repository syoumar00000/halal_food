import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/modals/widgets/cart_item_quantity.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/styles/text_style.dart';

class CartListItem extends StatefulWidget {
  final CartProvider cartState;
  final CartItemModel cartItem;
  const CartListItem({
    super.key,
    required this.cartItem,
    required this.cartState,
  });

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: KscreenWidth(context) - 40,
          // Ajout d'un padding vertical pour gérer la hauteur dynamiquement et proprement
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xff303030).withAlpha(5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Aligne l'image et la colonne de texte au centre
            children: [
              Flexible(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 1, // Force l'image à rester un carré parfait
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.cartItem.product.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              KSpaceW(1),

              // Zone de texte droite
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ligne Titre + Quantité
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xfff45a08),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "${widget.cartItem.quantity}",
                              style: KCaption(context, Colors.white)?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "${widget.cartItem.product.title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Options sélectionnées (Boisson, Sauce, etc.)
                      if (widget.cartItem.product
                          .getSelectedOptions()
                          .isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 6,
                          children: widget.cartItem.product
                              .getSelectedOptions()
                              .map(
                                (e) => Text(
                                  e,
                                  style: const TextStyle(
                                    color: Color(0xff727272),
                                    fontSize: 12,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],

                      const SizedBox(height: 4),
                      // Ligne Note / Étoiles
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ), // Réduit de 25 à 18 pour plus d'harmonie
                          const SizedBox(width: 4),
                          Text(
                            widget.cartItem.product.rate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),
                      // Ligne Prix et sélecteur de quantité
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$KCurrency${widget.cartItem.total}",
                            style: KSubtitle1(context)?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xfff45a08),
                            ),
                          ),
                          CartItemQuantity(
                            quantity: widget.cartItem.quantity.toString(),
                            onIncrement: (value) {
                              setState(() {
                                widget.cartState.incrementQuantity(value);
                              });
                            },
                            width: 30,
                            height: 30,
                            iconColor: const Color(0xffffffff),
                            backgroungColor: const Color(0xfff45a08),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
