import 'package:flutter/material.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/screens/product/widgets/default_app_bar.dart';
import 'package:h_food/styles/text_style.dart';
import 'package:h_food/widgets/product/product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  final CategoryModel category;
  const ProductListScreen({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productState = Provider.of<ProductProvider>(context, listen: true);
    final filteredProducts = productState.filteredItems;
    return Scaffold(
      appBar: DefaultAppBar(
        category: widget.category,
        title: widget.category.title!,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: filteredProducts.isNotEmpty
                  ? GridView.builder(
                      itemCount: filteredProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 8 / 11,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final product = filteredProducts[index];
                        return ProductCard(product: product);
                      },
                    )
                  : Center(
                      child: Text("No Items Found", style: KHeadline6(context)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
