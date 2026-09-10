import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/modals/cart_product_modal/cart_item_modal.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/screens/product/widgets/choose_size.dart';
import 'package:h_food/screens/product/widgets/product_image.dart';
import 'package:h_food/screens/product/widgets/product_info.dart';
import 'package:h_food/screens/product/widgets/text_onglet.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/utils/add_to_cart_toast.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductsModel product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // ÉTAPE 1 : On centralise la variable d'état ici au niveau du parent
  int _selectedPriceIndex = 0;
  int _currentQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImage(product: widget.product),
            Transform.translate(
              offset: const Offset(0, -35),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 15,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xff303030).withAlpha(25),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    ProductInfo(
                      product: widget.product,
                      onQuantityChanged: (quantity) {
                        _currentQuantity = quantity;
                      },
                    ),

                    // ÉTAPE 2 : On passe l'index et la fonction de mise à jour au widget ChooseSize
                    ChooseSize(
                      product: widget.product,
                      selectedPriceIndex: _selectedPriceIndex,
                      onSizeChanged: (index) {
                        setState(() {
                          _selectedPriceIndex =
                              index; // Met à jour l'écran et garde l'index en mémoire
                        });
                      },
                    ),

                    TextOnglet(label: "Add Ingredients"),

                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        DefaultButton(
                          backgroundColor: Color(0xfff45a08),
                          foregroundColor: Color(0xffffffff),
                          height: 48,
                          width: double.infinity,
                          label: "Add to cart",
                          onPressed: () async {
                            final cartState = Provider.of<CartProvider>(
                              context,
                              listen: false,
                            );

                            // ÉTAPE 3 : On récupère dynamiquement l'objet de prix sélectionné
                            final PriceItem chosenPrice =
                                widget.product.prices![_selectedPriceIndex];

                            final CartItemModel cartItem =
                                cartState.findCartItem(widget.product) ??
                                CartItemModel(
                                  product: widget.product,
                                  selectedPrice:
                                      chosenPrice, // Applique dynamiquement le prix choisi !
                                  quantity: _currentQuantity,
                                );

                            cartState.setTempCartItem(cartItem);

                            final result = await showCartItem(
                              context,
                              preview: true,
                            );
                            if (!context.mounted) return;
                            if (result == true) {
                              addToCartAlert(context, cartItem.product.title!);
                            }
                          },
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Text(
                            "$KCurrency${(widget.product.prices![_selectedPriceIndex].amount! * _currentQuantity).toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
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
    );
  }
}
