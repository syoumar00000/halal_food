import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:h_food/mockups/restaurant_mockup.dart';
import 'package:h_food/models/restaurant_model.dart';

class RestaurantProvider extends ChangeNotifier {
  // Liste source brute (catalogue complet)
  List<RestaurantModel> _items = [];

  // Liste filtrée qui est réellement lue par le GridView de l'interface
  List<RestaurantModel> _filteredItems = [];

  // Getters sécurisés en lecture seule
  UnmodifiableListView<RestaurantModel> get items =>
      UnmodifiableListView(_items);
  UnmodifiableListView<RestaurantModel> get filteredItems =>
      UnmodifiableListView(_filteredItems);

  // 1. CHARGEMENT ET CORRESPONDANCE RELATIONNELLE (Au démarrage)
  Future<List<RestaurantModel>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _items = restaurantMockup;
    notifyListeners();
    return _items;
  }
}
