import 'package:flutter/material.dart';
import 'package:h_food/widgets/header/simple_header.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "FAQ"),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 54,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff727272).withAlpha(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How do i place an order?",
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Color(0xff303030),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          ExpansionTile(
            title: const Text(
              "Cliquez ici pour voir le texte",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // Couleur quand le tiroir est ouvert
            iconColor: const Color(0xfff45a08),
            collapsedIconColor: const Color(0xff727272),
            // Le contenu qui va apparaître/disparaître
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xff727272).withAlpha(20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Voici le texte secret qui s'affiche uniquement lorsque l'on clique sur le widget parent !",
                  style: TextStyle(color: Color(0xff303030), fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
