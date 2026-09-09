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
      final cartState = Provider.of<CartProvider>(context, listen: true);
      final cartItem = cartState.tempCartItem!;
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: KscreenHeight(context) - 100,
            ),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
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
                      //header
                      CartItemHeader(cartItem: cartItem, preview: preview),
                      KSpaceH(0.75),
                      Divider(),
                      KSpaceH(0.75),
                      CartItemPriceOptions(
                        currentValue: cartItem.selectedPrice,
                        prices: cartItem.product.prices!,
                        onChanged: (PriceItem? item) {
                          setState(() {
                            cartState.selectPrice(item!);
                          });
                        },
                      ),
                      KSpaceH(0.5),
                      Divider(),
                      KSpaceH(0.5),
                      //product multiple options
                      ...cartItem.product.options!.map(
                        (option) => CartItemOptions(
                          option: option,
                          currentValue: cartItem.selectedPrice,
                          prices: cartItem.product.prices!,
                          onChanged: (String? value, [bool? checked]) {
                            setState(() {
                              if (!option.multiple! && value != null) {
                                cartState.setOption(option, value);
                              } else if (option.multiple! && value != null) {
                                cartState.setOption(
                                  option,
                                  value,
                                  checked: checked!,
                                );
                              }
                            });
                          },
                        ),
                      ),
                      //quantity
                      CartItemQuantity(
                        width: 50,
                        height: 50,
                        backgroungColor: Colors.grey.shade300,
                        iconColor: Colors.black,
                        quantity: cartItem.quantity.toString(),
                        onIncrement: (value) {
                          setState(() {
                            cartState.incrementQuantity(value);
                          });
                        },
                      ),
                      //remove from cart confirmation button
                      if (cartState.findCartItem(cartItem.product) != null) ...[
                        KSpaceH(2),
                        TextButton(
                          onPressed: () {
                            cartState.removeFromCart(cartItem);
                            Navigator.pop(ctx);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete_outline),
                              Text("Remove from cart"),
                            ],
                          ),
                        ),
                      ],
                      KSpaceH(5.5),
                    ],
                  ),
                ),
                //add to cart confirmation button
                CartItemConfirm(cartItem: cartItem),
              ],
            ),
          ),
        ),
      );
    },
  );
}
