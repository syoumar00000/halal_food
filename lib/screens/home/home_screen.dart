import 'package:flutter/material.dart';
import 'package:h_food/providers/ads_provider.dart';
import 'package:h_food/providers/category_provider.dart';
import 'package:h_food/providers/popular_provider.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/providers/promotion_provider.dart';
import 'package:h_food/screens/home/widgets/featured_popular.dart';
import 'package:h_food/screens/home/widgets/home_categories.dart';
import 'package:h_food/screens/home/widgets/home_popular.dart';
import 'package:h_food/screens/home/widgets/home_products.dart';
import 'package:h_food/screens/home/widgets/home_slide.dart';
import 'package:h_food/screens/home/widgets/main-app_bar.dart';
import 'package:h_food/screens/home/widgets/onglet_row.dart';
import 'package:h_food/screens/home/widgets/restaurant_around.dart';
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
    final popularState = context.read<PopularProvider>();

    final _productByOrders = [...productState.items];
    _productByOrders.sort(
      (a, b) => (b.orderCount ?? 0).compareTo(a.orderCount ?? 0),
    );

    final _mostOrderedProducts = _productByOrders.take(2).toList();

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          const MainAppBar(),
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    KSpaceH(1.5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: HomeSlide(adsItems: adsState.items),
                    ),
                    KSpaceH(1.5),
                    HomeCategories(items: categoryState.items),
                    KSpaceH(1.5),
                    FeaturedPopular(),
                    KSpaceH(1.5),
                    RestaurantAround(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//product.getFormattedPrice(product.prices![index])
