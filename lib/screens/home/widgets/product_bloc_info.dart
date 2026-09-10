import 'package:flutter/material.dart';

class ProductBlocInfo extends StatelessWidget {
  final String title;
  final String price;
  final String cookDuration;
  const ProductBlocInfo({
    super.key,
    required this.title,
    required this.price,
    required this.cookDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            // Ligne Titre + Prix
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  // product.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff303030),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                price,
                // product.getFormattedPrice(product.prices![0],  ),
                style: const TextStyle(
                  color: Color(0xfff45a08),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.motorcycle, size: 18, color: Color(0xfff45a08)),
              const SizedBox(width: 4),
              const Text(
                "Free Delivery",
                style: TextStyle(
                  color: Color(0xff727272),
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
              Spacer(),
              Icon(Icons.timelapse, size: 18, color: Color(0xfff45a08)),
              SizedBox(width: 5),
              Text(
                cookDuration,
                // "${product.cookDuration} mins",
                style: TextStyle(
                  color: Color(0xff727272),
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
