import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletExpensiontile extends StatelessWidget {
  const WalletExpensiontile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          //borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Color(0xff727272).withAlpha(50),
        collapsedBackgroundColor: Color(0xff727272).withAlpha(50),
        title: Row(
          children: [
            Image.asset(
              "assets/icons/wallet.png",
              width: 20,
              height: 20,
              color: Color(0xfff45a08),
            ),
            SizedBox(width: 8),
            Text(
              "E-Wallets",
              style: TextStyle(
                color: Color(0xff303030),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        // Couleur quand le tiroir est ouvert
        iconColor: const Color(0xff727272),
        collapsedIconColor: const Color(0xff727272),
        // Le contenu qui va apparaître/disparaître
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/vodaphone.png",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Vodaphone Cash",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff303030), fontSize: 17),
                  ),
                  Spacer(),
                  Radio(value: true),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/paypal.svg",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "e& Cash",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff727272), fontSize: 18),
                  ),
                  Spacer(),
                  Radio(value: true),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/bitcoin.svg",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Orange Cash",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff727272), fontSize: 18),
                  ),
                  Spacer(),
                  Radio(value: true),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_balance_rounded, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Bank Wallet",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff303030), fontSize: 17),
                  ),
                  Spacer(),
                  Radio(value: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
