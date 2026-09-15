import 'package:credit_card_type_detector/models.dart' show CreditCardType;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCardModel {
  CreditCardType? type;
  String number;
  String name;
  int month;
  int year;
  int cvv;

  PaymentCardModel({
    required this.type,
    required this.number,
    required this.name,
    required this.month,
    required this.year,
    required this.cvv,
  });

  Widget getCardIcon(double size) {
    // 1. 🟢 On récupère la valeur textuelle brute que vous avez validée ("visa" ou "mastercard")
    final cardBrand = type?.type.toLowerCase() ?? 'unknown';

    // 2. 🟢 On fait le switch sur cette valeur textuelle exacte
    switch (cardBrand) {
      case 'mastercard':
        return SvgPicture.asset(
          "assets/icons/mastercard.svg", // 💡 Vérifiez bien le "C" majuscule sur votre fichier réel !
          width: size,
          height: size,
        );
      case 'visa':
        return SvgPicture.asset(
          "assets/icons/visa.svg",
          width: size,
          height: size,
        );
      default:
        // Si la marque est inconnue, on affiche un visuel de carte générique propre au lieu d'un warning
        return Icon(
          Icons.credit_card,
          size: size,
          color: const Color(0xff727272),
        );
    }
  }
}
