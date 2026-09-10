import 'package:flutter/material.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (ctx, cartState, child) => Row(
        children: [
          Icon(Icons.shopping_basket_outlined),
          if (cartState.cartLength > 0)
            Container(
              width: 15,
              height: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xfff45a08),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "${cartState.cartLength}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
