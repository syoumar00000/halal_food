import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/screens/product/product_list_screen.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(category: category),
          ),
        );
      },
      child: Container(
        height: 60,
        width: 130,
        margin: const EdgeInsets.only(right: 12.0, top: 2.0, bottom: 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff303030).withAlpha(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Color(0xffffffff),
                image: DecorationImage(
                  image: AssetImage(category.icon!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                category.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Color(0xff303030)),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
