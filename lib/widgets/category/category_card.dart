import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/styles/text_style.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ProductProvider>(
          context,
          listen: false,
        ).getByCategory(category);
        //navigator.push productlistscreen
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(category.image!),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Text(
              category.title!,
              style: KHeadline6(
                context,
                Color(0xffffffff),
              )?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
