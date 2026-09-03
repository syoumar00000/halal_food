import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/screens/home/widgets/onglet_row.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/category/featured_category.dart';

class HomeCategories extends StatelessWidget {
  final List<CategoryModel> items;
  const HomeCategories({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OngletRow(label: "Categories", actionText: "See All"),
        KSpaceH(0.5),
        SizedBox(
          height: 60,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: items.map((e) => FeaturedCategory(category: e)).toList(),
          ),
        ),
      ],
    );
  }
}
