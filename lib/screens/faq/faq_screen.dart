import 'package:flutter/material.dart';
import 'package:h_food/screens/faq/widgets/expensiontile_widget.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "FAQ"),
          SizedBox(height: 13),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpensiontileWidget(
                    title: "How do i place an order?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "Can i cancel my order after placing it?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "How long does delivery usually take?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "Are there any delivery fees?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "What payment method are available?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "Can i schedule an order?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "Is there a minimum order amount?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "Where can i find my promo codes?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "How do i rate a restaurant?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
                  ),
                  ExpensiontileWidget(
                    title: "Can i reorder a previous meal?",
                    body:
                        "To place an order, simply select your favorite items from the restaurant menu, add them to your cart, and Tap 'Checkout'.You'll be guided through payment and delivery options.",
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
