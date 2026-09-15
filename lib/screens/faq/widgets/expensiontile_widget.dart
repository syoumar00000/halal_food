import 'package:flutter/material.dart';

class ExpensiontileWidget extends StatelessWidget {
  final String title;
  final String body;
  const ExpensiontileWidget({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: ClipRRect(
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
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xff303030),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          // Couleur quand le tiroir est ouvert
          iconColor: const Color(0xff727272),
          collapsedIconColor: const Color(0xff727272),
          // Le contenu qui va apparaître/disparaître
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Text(
                body,
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xff727272), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
