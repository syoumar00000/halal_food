import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_food/providers/restaurant_provider.dart';
import 'package:h_food/screens/home/widgets/onglet_row.dart';
import 'package:h_food/screens/restaurant/restaurant_screen.dart';
import 'package:h_food/styles/input/like_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

class RestaurantAround extends StatefulWidget {
  const RestaurantAround({super.key});

  @override
  State<RestaurantAround> createState() => _RestaurantAroundState();
}

class _RestaurantAroundState extends State<RestaurantAround> {
  @override
  void initState() {
    super.initState();
    // Appel asynchrone sécurisé dans l'initState pour éviter les boucles infinies
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RestaurantProvider>(context, listen: false).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OngletRow(label: "Nearest Restaurants", actionText: "See All"),
        KSpaceH(0.2),
        Consumer<RestaurantProvider>(
          builder: (context, restaurantState, child) {
            final filteredRestaurants = restaurantState.items;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restau = filteredRestaurants[index];
                final String iconPath = restau.icon ?? '';
                // Vérification si le fichier se termine par .svg (insensible à la casse)
                final bool isSvg = iconPath.toLowerCase().endsWith('.svg');
                final double cardWidth = KscreenWidth(context);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RestaurantScreen(restaurant: restau),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: cardWidth,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff727272).withAlpha(30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: isSvg
                                  ? SvgPicture.asset(
                                      iconPath,
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(iconPath, fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restau.title.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      restau.rate.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.motorcycle,
                                      color: Color(0xfff45a08),
                                      size: 18,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "Free Delivery",
                                      style: TextStyle(
                                        color: Color(0xff727272),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              LikeButton(
                                restau: restau,
                                fontColor: Color(0xffffffff),
                                iconColor: Color(0xfff45a08),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse_sharp,
                                    color: Color(0xfff45a08),
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    restau.deliveryTime.toString(),
                                    style: TextStyle(
                                      color: Color(0xff727272),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
