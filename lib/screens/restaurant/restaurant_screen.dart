import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/models/restaurant_model.dart';
import 'package:h_food/screens/restaurant/widgets/restau_image.dart';
import 'package:h_food/styles/spacing_style.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final String iconPath = restaurant.icon ?? '';
    // Vérification si le fichier se termine par .svg (insensible à la casse)
    final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RestauImage(restaurant: restaurant),
            Transform.translate(
              offset: Offset(0, -30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0xffffffff,
                  ), // Fond blanc ou une autre couleur propre
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 10,
                      offset: const Offset(
                        0,
                        -5,
                      ), // Ombre vers le haut pour accentuer l'effet
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0, -45),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color(0xffffffff),
                        ),
                        child: ClipOval(
                          child: isSvg
                              ? SvgPicture.asset(iconPath, fit: BoxFit.cover)
                              : Image.asset(iconPath, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Text(
                      restaurant.title.toString(),
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 19),
                              SizedBox(width: 2),
                              Text(
                                restaurant.rate.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff727272).withAlpha(120),
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1, // Épaisseur du trait
                            width:
                                30, // Espace total horizontal autour du trait
                            indent: 5, // Espace blanc en haut du trait
                            endIndent: 5,
                            color: Color(0xff727272),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.motorcycle,
                                color: Color(0xfff45a08),
                                size: 19,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "Free Delivery",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff727272).withAlpha(120),
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1, // Épaisseur du trait
                            width:
                                30, // Espace total horizontal autour du trait
                            indent: 5, // Espace blanc en haut du trait
                            endIndent: 5,
                            color: Color(0xff727272),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: Color(0xfff45a08),
                                size: 19,
                              ),
                              SizedBox(width: 2),
                              Text(
                                restaurant.deliveryTime.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff727272).withAlpha(120),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: KscreenWidth(context),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 232, 247, 169),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "20%",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "Off - the King's Combo!",
                                    style: TextStyle(
                                      color: Color(0xff303030),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
