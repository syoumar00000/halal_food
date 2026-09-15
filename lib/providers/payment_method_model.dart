import 'package:h_food/models/payment_card_model.dart';

class PaymentMethodModel {
  final PaymentMethodType type;
  final String? paypalAccount;
  final PaymentCardModel? creditCard;

  PaymentMethodModel({required this.type, this.paypalAccount, this.creditCard});
}

enum PaymentMethodType { paypal, creditCard }
