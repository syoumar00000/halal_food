import 'package:flutter/material.dart';
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
    // Utilisation recommandée de context.read pour éviter les rebuilds inutiles sur l'accueil
    final promotionState = context.read<PromotionProvider>();
    final categoryState = context.read<CategoryProvider>();
    final productState = context.read<ProductProvider>();

    // Tri des produits par popularité
    final _productByOrders = [...productState.items];
    _productByOrders.sort(
      (a, b) => (b.orderCount ?? 0).compareTo(a.orderCount ?? 0),
    );

    // Sécurisation de la liste avec .take() comme nous l'avons appris
    final _mostOrderedProducts = _productByOrders.take(2).toList();

    return Scaffold(
      backgroundColor: const Color(0xffffffff), // Fond blanc propre
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(), // Scroll global fluide
        child: Column(
          children: [
            const MainAppBar(),
            KSpaceH(1.5),
            AspectRatio(
              aspectRatio: 2.2,
              child: HomeSlide(items: promotionState.items),
            ),
            KSpaceH(1.25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("See All", style: TextStyle(color: Color(0xfff45a08))),
                ],
              ),
            ),
            KSpaceH(1),
            SizedBox(
              height: 100,
              child: HomeCategories(items: categoryState.items),
            ),
            KSpaceH(1.75),
            // Cela donne une limite stricte à la Column et résout le bug "hasSize"
            SizedBox(
              height:
                  280, // Hauteur totale pour contenir le titre + le carrousel horizontal
              child: HomeProducts(
                title: "Popular Now",
                products: _mostOrderedProducts,
                onMorePress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
