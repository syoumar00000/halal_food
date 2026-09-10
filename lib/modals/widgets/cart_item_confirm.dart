import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

class CartItemConfirm extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItemConfirm({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: false);
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: KscreenWidth(context) - 25,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xfff45a08)),
            onPressed: () {
              cartState.addToCart(cartItem);
              Navigator.pop(context, true);
            },
            child: Text(
              "Continue - $KCurrency${cartItem.total.toStringAsFixed(2)}",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
