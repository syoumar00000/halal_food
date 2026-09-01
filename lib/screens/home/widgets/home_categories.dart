import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/widgets/category/featured_category.dart';

class HomeCategories extends StatelessWidget {
  final List<CategoryModel> items;
  const HomeCategories({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: items.map((e) => FeaturedCategory(category: e)).toList(),
    );
  }
}
