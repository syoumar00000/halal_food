import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:h_food/mockups/product_mockup.dart';
import 'package:h_food/models/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductsModel> _items = [
    productMockup[0],
    productMockup[10],
    productMockup[5],
    productMockup[27],
    productMockup[27],
  ];
  UnmodifiableListView<ProductsModel> get items => UnmodifiableListView(_items);
  bool isFavorite(ProductsModel element) => items.contains(element);
  // get promotionnal items
  toggle(ProductsModel product) {
    //check if product exist in favoris
    final existingProduct = _items.firstWhereOrNull(
      (element) => element.id == product.id,
    );
    // add if not exist
    if (existingProduct == null) {
      _items.add(product);
    } else {
      //remove
      _items.remove(existingProduct);
    }

    notifyListeners();
  }
}
