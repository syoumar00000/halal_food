import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/screens/product/widgets/smart_counter.dart';
import 'package:h_food/screens/product/widgets/text_onglet.dart';

class ProductInfo extends StatefulWidget {
  final ProductsModel product;
  const ProductInfo({super.key, required this.product});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    final String iconPath = widget.product.restaurant?.icon ?? '';

    // Vérification si le fichier se termine par .svg (insensible à la casse)
    final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TITRE DU PRODUIT PROTÉGÉ CONTRE LES DEBORDEMENTS
            Expanded(
              child: Text(
                widget.product.title ?? "Produit",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff303030),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // COMPTEUR DE QUANTITÉ SMART
            SmartCounter(),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30, // Équivalent à un rayon (radius) de 15
              height: 30,
              child: ClipOval(
                child: isSvg
                    ? SvgPicture.asset(iconPath, fit: BoxFit.cover)
                    : Image.asset(iconPath, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            Text(
              widget.product.restaurant!.title!,
              style: TextStyle(
                color: Color(0xff727272).withAlpha(100),
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  SizedBox(width: 2),
                  Text(
                    widget.product.rate.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff727272).withAlpha(120),
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                thickness: 1, // Épaisseur du trait
                width: 30, // Espace total horizontal autour du trait
                indent: 5, // Espace blanc en haut du trait
                endIndent: 5,
                color: Color(0xff727272),
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse_rounded,
                    color: Color(0xfff45a08),
                    size: 20,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "${widget.product.cookDuration.toString()} min",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff727272).withAlpha(120),
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                thickness: 1, // Épaisseur du trait
                width: 30, // Espace total horizontal autour du trait
                indent: 5, // Espace blanc en haut du trait
                endIndent: 5,
                color: Color(0xff727272),
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: Color(0xfff45a08),
                    size: 20,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "${widget.product.calories.toString()} Kcal",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff727272).withAlpha(120),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        TextOnglet(label: "Description"),
        SizedBox(height: 10),
        Text(widget.product.description!, textAlign: TextAlign.start),
        SizedBox(height: 15),
      ],
    );
  }
}
