import 'package:flutter/material.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/screens/cart/widgets/cart_list_item.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/empty_file/empty_container.dart';
import 'package:h_food/widgets/header/simple_header.dart';
import 'package:h_food/widgets/navigation/main_bottom_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: true);
    double deliveryFee = 5.50;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          // 1. En-tête qui reste figé tout en haut
          const SimpleHeader(title: "Cart"),

          // 2. Zone de contenu (Défilement global ou message vide)
          cartState.cart.cartItems.isNotEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding:
                          KBodyPadding, // Applique le padding global à tout le bloc défilant
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ─── LA CORRECTION PRINCIPALE : Affichage des produits à la suite ───
                          // Utiliser .map() ici permet d'insérer les produits directement dans le flux vertical
                          // sans créer de ListView à hauteur infinie. Plus de plantage "hasSize" !
                          ...cartState.cart.cartItems.map((cartItem) {
                            return CartListItem(
                              cartItem: cartItem,
                              cartState: cartState,
                            );
                          }),

                          const SizedBox(height: 10),

                          // ─── LE BLOC RÉSUMÉ : Il descend naturellement sous le dernier produit ───
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            width: KscreenWidth(context),
                            height: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xfff45a08).withAlpha(30),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xfff45a08),
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Icon(
                                    Icons.percent_sharp,
                                    color: Color(0xfff45a08),
                                    size: 10,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Promo code",
                                  style: TextStyle(
                                    color: Color(0xfff45a08),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: DefaultButton(
                                    onPressed: () {},
                                    label: "Apply",
                                    backgroundColor: const Color(0xfff45a08),
                                    foregroundColor: const Color(0xffffffff),
                                    height: 48,
                                    width: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  "Sub-Total",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "\$${cartState.cart.total.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Delivery Fee",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$${deliveryFee.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Total - Cost",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$${(cartState.cart.total + deliveryFee).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Color(0xfff45a08),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ), // Espace avant le bouton final

                          Center(
                            child: DefaultButton(
                              onPressed: () {},
                              label: "Checkout",
                              backgroundColor: const Color(0xfff45a08),
                              foregroundColor: const Color(0xffffffff),
                              height: 48,
                              width: KscreenWidth(context) - 40,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ), // Marge en bas pour ne pas coller à la barre de navigation
                        ],
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: EmptyContainer(
                    title: "Your Cart is Empty!",
                    subTitle:
                        "Start exploring restaurants and add your favourites here",
                    labelButton: "Shop Now",
                  ),
                ),
        ],
      ),
      bottomNavigationBar: const MainBottomBar(currentIndex: 1),
    );
  }
}
