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
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Cart"),
          cartState.cart.cartItems.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    padding: KBodyPadding,
                    itemCount: cartState.cart.cartItems.length,
                    itemBuilder: (ctx, index) {
                      final cartItem = cartState.cart.cartItems[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CartListItem(
                            cartItem: cartItem,
                            cartState: cartState,
                          ),
                        ],
                      );
                    },
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
          Container(
            margin: EdgeInsets.all(8),
            width: KscreenWidth(context),
            height: 55,
            decoration: BoxDecoration(
              color: Color(0xfff45a08).withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: Color(0xfff45a08)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.percent_sharp,
                    color: Color(0xfff45a08),
                    size: 15,
                  ),
                ),
                SizedBox(width: 5),
                Text("Promo code", style: TextStyle(color: Color(0xfff45a08))),
                Spacer(),
                DefaultButton(
                  onPressed: () {},
                  label: "Apply",
                  backgroundColor: Color(0xfff45a08),
                  foregroundColor: Color(0xffffffff),
                  height: 48,
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomBar(currentIndex: 1),
    );
  }
}
