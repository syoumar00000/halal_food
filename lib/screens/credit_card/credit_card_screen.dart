import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class CreditCardFormScreen extends StatefulWidget {
  const CreditCardFormScreen({super.key});

  @override
  State<CreditCardFormScreen> createState() => _CreditCardFormScreenState();
}

class _CreditCardFormScreenState extends State<CreditCardFormScreen> {
  String cardNumber = "";
  bool isCvvFocused = false;
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleHeader(title: "Add Credit Card"),
          //fake credit card widget
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardWidget(
                    cardBgColor: Color(0xfff45a08),
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    textStyle: GoogleFonts.sourceSans3().copyWith(
                      fontSize: 18,
                      color: isCvvFocused ? Colors.black : Colors.white,
                    ),
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    onCreditCardWidgetChange: (CreditCardBrand) {},
                  ),
                  //new credit card form
                  //flutter credit card plugin
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    inputConfiguration: InputConfiguration(
                      //themeColor: Colors.blue,
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name',
                      ),
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  KSpaceH(3),
                  Padding(
                    padding: KBodyPadding,
                    child: DefaultButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(context, "/credit-card-list");
                        var val = CreditCardModel(
                          cardNumber,
                          expiryDate,
                          cardHolderName,
                          cvvCode,
                          isCvvFocused,
                        );
                      },
                      label: "Save and Continue",
                      backgroundColor: Color(0xfff45a08),
                      foregroundColor: Color(0xffffffff),
                      height: 43,
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
