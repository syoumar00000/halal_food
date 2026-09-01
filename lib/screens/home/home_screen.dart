import 'package:flutter/material.dart';
import 'package:h_food/providers/ads_provider.dart';
import 'package:h_food/providers/category_provider.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/providers/promotion_provider.dart';
import 'package:h_food/screens/home/widgets/home_categories.dart';
import 'package:h_food/screens/home/widgets/home_products.dart';
import 'package:h_food/screens/home/widgets/home_slide.dart';
import 'package:h_food/screens/home/widgets/main-app_bar.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final promotionState = context.read<PromotionProvider>();
    final categoryState = context.read<CategoryProvider>();
    final productState = context.read<ProductProvider>();
    final adsState = context.read<AdsProvider>();

    final _productByOrders = [...productState.items];
    _productByOrders.sort(
      (a, b) => (b.orderCount ?? 0).compareTo(a.orderCount ?? 0),
    );

    final _mostOrderedProducts = _productByOrders.take(2).toList();

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const MainAppBar(),
            KSpaceH(1.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: HomeSlide(adsItems: adsState.items),
            ),
            KSpaceH(1.5),
            HomeCategories(items: categoryState.items),
            /* Column(
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
                        style: TextStyle(
                          color: Color(0xfff45a08),
                          fontSize: 18,
                        ),
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
                      itemCount: categoryState.items.length,
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
                                      image: AssetImage(
                                        categoryState.items[index].icon!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    categoryState.items[index].title!,
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
            ), */
          ],
        ),
      ),
    );
  }
}
