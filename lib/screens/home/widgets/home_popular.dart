/* import 'package:flutter/material.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/providers/popular_provider.dart';
import 'package:h_food/screens/home/widgets/featured_popular.dart';
import 'package:h_food/screens/home/widgets/onglet_row.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:provider/provider.dart';

class HomePopular extends StatefulWidget {
  final List<ProductsModel> items;
  const HomePopular({super.key, required this.items});

  @override
  State<HomePopular> createState() => _HomePopularState();
}

class _HomePopularState extends State<HomePopular> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OngletRow(label: "Popular Now", actionText: "See All"),
        KSpaceH(0.5),
        SizedBox(
          height: 160,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: widget.items
                .map((e) => FeaturedPopular(product: e))
                .toList(),
          ),
        ),
      ],
    );
  }

  /*    final popularState = Provider.of<PopularProvider>(
      context,
      listen: false,
    ).getAll();

    return Consumer<PopularProvider>(
      builder: (context, popularState, child) {
        final filteredProducts = popularState.items;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ListView(
              scrollDirection: Axis.vertical,
              children: ,
            );
          },
        );
      },
    ); */
}
 */
