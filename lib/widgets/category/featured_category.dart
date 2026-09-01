import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:provider/provider.dart';

class FeaturedCategory extends StatelessWidget {
  final CategoryModel category;
  const FeaturedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ProductProvider>(
          context,
          listen: false,
        ).getByCategory(category);
        //navigator. push to productListScreen
      },
      child: Container(
        width: 75,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(category.icon!, height: 42),
            ),
            SizedBox(height: 5),
            Text(
              category.title!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
