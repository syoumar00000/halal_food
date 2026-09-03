import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:h_food/mockups/category_mockup.dart';
import 'package:h_food/mockups/popular_mockup.dart';
import 'package:h_food/models/product_model.dart';

class PopularProvider extends ChangeNotifier {
  // Liste source brute (catalogue complet)
  List<ProductsModel> _items = [];

  // Liste filtrée qui est réellement lue par le GridView de l'interface
  List<ProductsModel> _filteredItems = [];

  // Getters sécurisés en lecture seule
  UnmodifiableListView<ProductsModel> get items => UnmodifiableListView(_items);
  UnmodifiableListView<ProductsModel> get filteredItems =>
      UnmodifiableListView(_filteredItems);

  // 1. CHARGEMENT ET CORRESPONDANCE RELATIONNELLE (Au démarrage)
  Future<List<ProductsModel>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _items = popularMockup;
    notifyListeners();
    return _items;
  }
}
