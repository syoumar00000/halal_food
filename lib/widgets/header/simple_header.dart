import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';

class SimpleHeader extends StatelessWidget {
  final String title;
  const SimpleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
    return Container(
      width: KscreenWidth(context),
      height: KscreenHeight(context) / 6,
      decoration: const BoxDecoration(
        color: brandOrange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      // La Stack permet de superposer l'icône par-dessus sans décaler le titre
      child: Stack(
        children: [
          // 1. LE TITRE : Centré de manière absolue au milieu du Container
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xffffffff),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 2. L'ICÔNE : Alignée au centre-gauche avec sa marge de 20 pixels
          Align(
            alignment: Alignment.centerLeft, // Calé au milieu à gauche
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ), // L'espace de 20 par rapport à sa gauche
              child: GestureDetector(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pop(); // Permet de retourner à l'écran précédent
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffffff).withAlpha(60),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xffffffff),
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
