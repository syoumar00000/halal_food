import 'package:flutter/material.dart';
import 'package:h_food/modals/widgets/cart_header_item.dart';
import 'package:h_food/modals/widgets/cart_item_confirm.dart';
import 'package:h_food/modals/widgets/cart_item_options.dart';
import 'package:h_food/modals/widgets/cart_item_quantity.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

Future<bool?> showCartItem(BuildContext context, {bool preview = true}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      // ─── LA CORRECTION PRINCIPALE : Utilisation de Consumer pour écouter le Provider en temps réel ───
      return Consumer<CartProvider>(
        builder: (context, cartState, child) {
          // Récupération de l'item temporaire mis à jour dynamiquement
          final cartItem = cartState.tempCartItem!;

          return SafeArea(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: KscreenHeight(context) - 100,
              ),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        CartItemHeader(cartItem: cartItem, preview: preview),
                        KSpaceH(0.75),
                        const Divider(),
                        KSpaceH(0.75),

                        // Choix de la taille
                        CartItemPriceOptions(
                          currentValue: cartItem.selectedPrice,
                          prices: cartItem.product.prices!,
                          onChanged: (PriceItem? item) {
                            cartState.selectPrice(item!);
                          },
                        ),
                        KSpaceH(0.5),
                        const Divider(),
                        KSpaceH(0.5),

                        // Options multiples
                        ...cartItem.product.options!.map(
                          (option) => CartItemOptions(
                            option: option,
                            currentValue: cartItem.selectedPrice,
                            prices: cartItem.product.prices!,
                            onChanged: (String? value, [bool? checked]) {
                              if (!option.multiple! && value != null) {
                                cartState.setOption(option, value);
                              } else if (option.multiple! && value != null) {
                                cartState.setOption(
                                  option,
                                  value,
                                  checked: checked!,
                                );
                              }
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ─── LA CORRECTION DU COMPTEUR ───
                        // On utilise incrementQuantity qui cible directement l'item temporaire en cours de création
                        CartItemQuantity(
                          width: 50,
                          height: 50,
                          backgroungColor: Colors.grey.shade300,
                          iconColor: Colors.black,
                          quantity: cartItem.quantity.toString(),
                          onIncrement: (value) {
                            cartState.changeQuantity(
                              1,
                            ); // Ajoute 1 à l'item temporaire
                          },
                          onDecrement: (value) {
                            cartState.changeQuantity(
                              -1,
                            ); // Retire 1 à l'item temporaire
                          },
                        ),

                        // Bouton de suppression du panier (si déjà existant)
                        if (cartState.findCartItem(cartItem.product) !=
                            null) ...[
                          KSpaceH(2),
                          TextButton(
                            onPressed: () {
                              cartState.removeFromCart(cartItem);
                              Navigator.pop(ctx);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.delete_outline),
                                SizedBox(width: 4),
                                Text("Remove from cart"),
                              ],
                            ),
                          ),
                        ],
                        KSpaceH(5.5),
                      ],
                    ),
                  ),
                  // Bouton de confirmation (Ajouter / Mettre à jour)
                  CartItemConfirm(cartItem: cartItem),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
