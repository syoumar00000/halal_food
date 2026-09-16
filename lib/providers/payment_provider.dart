import 'dart:collection';

import 'package:credit_card_type_detector/models.dart' show CreditCardType;
import 'package:flutter/material.dart';
import 'package:h_food/models/payment_card_model.dart';
import 'package:h_food/providers/payment_method_model.dart';

class PaymentProvider extends ChangeNotifier {
  final List<PaymentCardModel> _cards = [
    PaymentCardModel(
      type: CreditCardType.visa(),
      number: "0000 1111 2222 4562",
      name: "Sigmund Freud",
      month: 5,
      year: 90,
      cvv: 336,
    ),
    PaymentCardModel(
      type: CreditCardType.visa(),
      number: "3333 4444 5555 5589",
      name: "Leo Messi",
      month: 5,
      year: 90,
      cvv: 336,
    ),
    PaymentCardModel(
      type: CreditCardType.mastercard(),
      number: "6666 7777 8888 1203",
      name: "Edouard Mendy",
      month: 5,
      year: 90,
      cvv: 336,
    ),
  ];

  List<PaymentMethodModel> _paymentMethods = [];
  PaymentMethodModel? _selectedPaymentMethod;

  UnmodifiableListView<PaymentCardModel> get cards =>
      UnmodifiableListView(_cards);
  UnmodifiableListView<PaymentMethodModel> get paymentMethods =>
      UnmodifiableListView(_paymentMethods);
  PaymentMethodModel? get selectedPaymentMethod => _selectedPaymentMethod;

  getAllCards() {
    notifyListeners();
  }

  //select or change current payment method
  selectAddress(PaymentMethodModel paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  getAllPaymentMethod() {
    _paymentMethods.addAll([
      PaymentMethodModel(
        type: PaymentMethodType.creditCard,
        creditCard: _cards[0],
      ),
      PaymentMethodModel(
        type: PaymentMethodType.creditCard,
        creditCard: _cards[1],
      ),
      PaymentMethodModel(
        type: PaymentMethodType.creditCard,
        creditCard: _cards[2],
      ),
      PaymentMethodModel(
        type: PaymentMethodType.paypal,
        paypalAccount: "Faye@company.sn",
      ),
    ]);
    _selectedPaymentMethod = _paymentMethods[1];
    notifyListeners();
  }
}
