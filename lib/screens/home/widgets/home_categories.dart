import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/category/featured_category.dart';

class HomeCategories extends StatelessWidget {
  final List<CategoryModel> items;
  const HomeCategories({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  color: Color(0xff727272),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(color: Color(0xfff45a08), fontSize: 18),
              ),
            ],
          ),
        ),
        KSpaceH(0.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff303030).withAlpha(55),
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
                              image: AssetImage(items[index].icon!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            items[index].title!,
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
              },
            ),
          ),
        ),
      ],
    );

    /*  ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: items.map((e) => FeaturedCategory(category: e)).toList(),
    ); */
  }
}
