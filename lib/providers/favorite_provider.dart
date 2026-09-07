import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:h_food/mockups/product_mockup.dart';
import 'package:h_food/mockups/restaurant_mockup.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/models/restaurant_model.dart';

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

  final List<RestaurantModel> _restauItems = [
    restaurantMockup[0],
    restaurantMockup[1],
    restaurantMockup[2],
    restaurantMockup[3],
    restaurantMockup[4],
  ];
  UnmodifiableListView<RestaurantModel> get restauItems =>
      UnmodifiableListView(_restauItems);
  bool isLiked(RestaurantModel element) => restauItems.contains(element);
  restauToogle(RestaurantModel restau) {
    final existingRestau = _restauItems.firstWhereOrNull(
      (element) => element.id == restau.id,
    );
    if (existingRestau == null) {
      _restauItems.add(restau);
    } else {
      _restauItems.remove(existingRestau);
    }
    notifyListeners();
  }
}
