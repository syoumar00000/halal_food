import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';

class CartItemQuantity extends StatelessWidget {
  final String quantity;
  final double width;
  final double height;
  final Color iconColor;
  final Color backgroungColor;
  final Function(int value) onIncrement;
  final Function(int value) onDecrement;
  const CartItemQuantity({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.width,
    required this.height,
    required this.iconColor,
    required this.backgroungColor,
  });

  @override
  Widget build(BuildContext context) {
    /*  Text(
                              " $KCurrency${cartState.cart.total.toStringAsFixed(2)}",
                            ), */
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: backgroungColor,
              shape: CircleBorder(),
              elevation: 0,
            ),
            onPressed: () => onDecrement(-1),
            child: Icon(
              Icons.remove,
              size: width >= 50 ? 25 : 15,
              color: iconColor,
            ),
          ),
        ),
        KSpaceW(1.25),
        Text(quantity, style: Theme.of(context).textTheme.titleLarge),
        KSpaceW(1.25),
        SizedBox(
          width: width,
          height: height,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: backgroungColor,
              shape: CircleBorder(),
              elevation: 0,
            ),
            onPressed: () => onIncrement(1),
            child: Icon(
              Icons.add,
              size: width >= 50 ? 25 : 15,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }
}
