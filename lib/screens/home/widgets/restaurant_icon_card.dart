import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RestaurantIconCard extends StatelessWidget {
  final String iconPath;
  final bool isSvg;
  const RestaurantIconCard({
    super.key,
    required this.iconPath,
    required this.isSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, // Réduit de 60 à 50 pour équilibrer le layout
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ClipOval(
        child: isSvg
            ? SvgPicture.asset(iconPath, fit: BoxFit.cover)
            : Image.asset(iconPath, fit: BoxFit.cover),
      ),
    );
  }
}
