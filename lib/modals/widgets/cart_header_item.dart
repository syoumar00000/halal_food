import 'package:flutter/material.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/styles/spacing_style.dart';

class CartItemHeader extends StatelessWidget {
  final CartItemModel cartItem;
  final bool preview;
  const CartItemHeader({
    super.key,
    required this.cartItem,
    this.preview = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        KSpaceW(1.5),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(cartItem.product.image!, width: 60),
        ),
        KSpaceW(1),
        Text(
          cartItem.product.title!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Spacer(),
        if (preview == true)
          IconButton(
            onPressed: () {
              /*   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ProductScreen()) 
                );   */
            },
            icon: Icon(Icons.visibility_outlined, size: 20),
          ),
      ],
    );
  }
}
