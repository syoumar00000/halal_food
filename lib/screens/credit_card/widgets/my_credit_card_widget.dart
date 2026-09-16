// À insérer directement à la place du design de la ligne dans votre ListView.builder :
import 'package:flutter/material.dart';
import 'package:h_food/models/payment_card_model.dart';

Widget buildCardItem(
  BuildContext context,
  PaymentCardModel card,
  VoidCallback onDelete,
) {
  return Container(
    width: double.infinity,
    height: 200, // Hauteur standard d'une carte bancaire
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      // Dégradé moderne aux couleurs de H_Food (Orange vers Anthracite)
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xfff45a08), Color(0xff303030)],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(40),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1️⃣ PREMIÈRE LIGNE : Puce à gauche, Icône de carte à droite
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icône de la puce électronique SIM dorée / blanche
            const Icon(
              Icons.sim_card_outlined,
              color: Colors.white70,
              size: 32,
            ),
            // Votre méthode qui récupère l'icône Visa ou MasterCard
            card.getCardIcon(35),
          ],
        ),

        // 2️⃣ DEUXIÈME LIGNE : Numéro de la carte CENTRÉ
        Center(
          child: Text(
            card.number, // "4000 0000 0000 4562"
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily:
                  'monospace', // Donne l'effet "relief" d'une vraie carte
              letterSpacing: 2.0,
            ),
          ),
        ),

        // 3️⃣ TROISIÈME LIGNE : Valid Thru et Date à gauche, Poubelle à droite
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Bloc d'expiration (Aligné à gauche)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "VALID THROUGH",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  // Ajoute automatiquement un "0" au mois s'il est inférieur à 10 (ex: 5 -> 05)
                  "${card.month.toString().padLeft(2, '0')}/${card.year}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Icône Poubelle blanche (Alignée à droite)
            IconButton(
              onPressed: onDelete,
              constraints:
                  const BoxConstraints(), // Supprime les marges internes par défaut
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: Colors
                    .white, // Blanc pour rester harmonieux sur le fond orange/sombre
                size: 24,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
