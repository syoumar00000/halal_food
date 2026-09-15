import 'package:flutter/material.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/providers/cart_provider.dart';
import 'package:h_food/providers/payment_provider.dart';
import 'package:h_food/screens/faq/widgets/expensiontile_widget.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/card_expensiontile/card_expensiontile.dart';
import 'package:h_food/widgets/header/simple_header.dart';
import 'package:h_food/widgets/wallet_expensiontile/wallet_expensiontile.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;
  final double subTotal;
  final double deliveryFee;
  final List<CartItemModel> cartItems;
  const CheckoutScreen({
    super.key,
    required this.total,
    required this.subTotal,
    required this.deliveryFee,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Checkout"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                            color: Color(0xff303030),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 120,
                          width: KscreenWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff303030).withAlpha(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Color(0xfff45a08),
                                      size: 18,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                        color: Color(0xff303030),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: Color(0xff303030),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "+2250102030405",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Cité des arts, cocody",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Choose Method Payment",
                          style: TextStyle(
                            color: Color(0xff303030),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xff303030).withAlpha(50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.money,
                                  size: 18,
                                  color: Color(0xfff45a08),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Cash on delivery",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        CardExpensionTile(),
                        SizedBox(height: 10),
                        WalletExpensiontile(),
                        SizedBox(height: 10),
                        Text(
                          "Order Summary",
                          style: TextStyle(
                            color: Color(0xff303030),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
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
                              "\$${subTotal.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Color(0xff303030),
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
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
                        Divider(),
                        Row(
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
                              "\$${(total).toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Color(0xfff45a08),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DefaultButton(
                      onPressed: () {},
                      label: "Complete Payment",
                      backgroundColor: Color(0xfff45a08),
                      foregroundColor: Color(0xffffffff),
                      height: 48,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
