import 'package:credit_card_type_detector/models.dart';
import 'package:flutter/material.dart';
import 'package:h_food/providers/payment_provider.dart';
import 'package:provider/provider.dart';

class CardExpensionTile extends StatelessWidget {
  const CardExpensionTile({super.key});

  @override
  Widget build(BuildContext context) {
    final creditCardState = Provider.of<PaymentProvider>(context, listen: true);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        shape: RoundedRectangleBorder(side: BorderSide.none),
        backgroundColor: const Color(0xff727272).withAlpha(50),
        collapsedBackgroundColor: const Color(0xff727272).withAlpha(50),
        title: const Row(
          children: [
            Icon(Icons.credit_card, color: Color(0xfff45a08), size: 18),
            SizedBox(width: 8),
            Text(
              "Credit/Debit Card",
              style: TextStyle(
                color: Color(0xff303030),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        iconColor: const Color(0xff727272),
        collapsedIconColor: const Color(0xff727272),
        children: [
          ListView.builder(
            shrinkWrap: true, // 👈 Indispensable dans un ExpansionTile
            physics:
                const NeverScrollableScrollPhysics(), // 👈 Laisse l'accordéon gérer le défilement
            itemCount: creditCardState.cards.length,
            itemBuilder: (ctx, index) {
              final card = creditCardState.cards[index];
              final type = card.type;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ), // Padding ajusté
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ), // Permet au container de s'adapter au contenu
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      card.getCardIcon(30),
                      const SizedBox(width: 12),
                      Text(
                        card.number,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0xff727272),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      // 💡 Pensez à lier la valeur du Radio à l'état de votre Provider plus tard
                      Radio(
                        value: index,
                        groupValue:
                            0, // Remplacez par votre variable d'index sélectionné
                        onChanged: (val) {},
                        activeColor: const Color(0xfff45a08),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // 2. 🟢 CORRECTION BOUTON "ADD CARD" : Le widget Expanded a été supprimé
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              "/credit-card-form-screen",
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 67, 82).withAlpha(30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 18,
                      color: Color(0xfff45a08),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Add Card",
                      style: TextStyle(
                        color: Color(0xfff45a08),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
