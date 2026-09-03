import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CategoryModel category;

  const DefaultAppBar({
    super.key,
    required this.category,
    required String
    title, // Pensez à l'utiliser ou le supprimer s'il ne sert pas
  });

  @override
  Widget build(BuildContext context) {
    // Sécurisation de la variable title
    final titleText = category.title ?? 'Category';

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xfff45a08),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ), // Arrondit uniquement le bas
      ),
      // 1. 🟢 On utilise flexibleSpace pour injecter et centrer notre propre ligne d'éléments
      flexibleSpace: SafeArea(
        child: Container(
          alignment: Alignment
              .center, // 👈 Centre verticalement tout le contenu dans les 110px
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // BOUTON RETOUR
              InkWell(
                onTap: () => Navigator.maybePop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffffff).withAlpha(60),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xffffffff),
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // TITRE DE LA CATEGORIE
              Expanded(
                child: Text(
                  titleText,
                  style: const TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // ACTION : RECHERCHE
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffffffff).withAlpha(60),
                ),
                child: const Icon(Icons.search, color: Color(0xffffffff)),
              ),
              const SizedBox(width: 10),

              // ACTION : FILTRE / SETTINGS
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffffffff).withAlpha(60),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/settings-sliders.png",
                    width:
                        22, // Légèrement réduit pour être mieux centré dans le carré de 40
                    height: 22,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
