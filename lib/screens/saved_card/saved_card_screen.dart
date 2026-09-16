import 'package:flutter/material.dart';
import 'package:h_food/providers/payment_provider.dart';
import 'package:h_food/screens/credit_card/widgets/my_credit_card_widget.dart';
import 'package:h_food/widgets/header/simple_header.dart';
import 'package:provider/provider.dart';

class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final creditCardState = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Saved Card"),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: creditCardState.cards.length,
              itemBuilder: (ctx, index) {
                final card = creditCardState.cards[index];
                return buildCardItem(context, card, () {
                  //delete logical here
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff45a08),
        onPressed: () {
          Navigator.pushNamed(context, "/credit-card-form-screen");
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
