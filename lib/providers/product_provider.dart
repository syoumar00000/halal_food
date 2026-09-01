// lib/providers/product_provider.dart
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:h_food/mockups/category_mockup.dart';
import 'package:h_food/mockups/product_mockup.dart';
import 'package:h_food/models/category_model.dart';
import 'package:h_food/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
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
    await Future.delayed(
      const Duration(milliseconds: 200),
    ); // Simule une attente réseau

    _items = productMockup.map((product) {
      // On retrouve l'objet catégorie complet à partir de son ID numérique
      final fullCategory = categoryMockup.firstWhere(
        (category) => category.id == product.category!.id,
        orElse: () => product.category!, // Sécurité si non trouvée
      );

      // On associe la catégorie complète au produit
      product.category = fullCategory;
      return product;
    }).toList();

    // Par défaut, au premier chargement, la liste filtrée contient tout le catalogue
    _filteredItems = List.from(_items);
    notifyListeners();
    return _filteredItems;
  }

  // 2. FILTRAGE SIMPLE PAR ONGLET (ListView Horizontale)
  void getByCategory(CategoryModel category) {
    _filteredItems = _items
        .where((element) => element.category!.id == category.id)
        .toList();
    notifyListeners();
  }

  // 3. RECHERCHE PAR MOT-CLÉ (Barre de recherche)
  void searchProduct(String searchValue) {
    if (searchValue.trim().isEmpty) {
      _filteredItems = List.from(
        _items,
      ); // Si recherche vide, on réaffiche tout
    } else {
      final query = searchValue.trim().toLowerCase();
      _filteredItems = _items
          .where((element) => element.title!.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }

  // 4. FILTRAGE AVANCÉ MULTICRITÈRES (Boutons filtres / Sliders)
  void filterProducts({
    required List<int> categoryIds,
    required List<double> priceRange,
    required List<double> cookDurationRange,
    required List<double> caloryRange,
  }) {
    // Optimisation : Un seul parcours de liste (.where) au lieu de 4 successifs
    _filteredItems = _items.where((element) {
      // A. Vérification de la catégorie (si la liste de filtres n'est pas vide)
      if (categoryIds.isNotEmpty &&
          !categoryIds.contains(element.category!.id)) {
        return false;
      }

      // B. Vérification du prix (sur la première déclinaison disponible)
      if (element.prices!.isNotEmpty) {
        final price = element.prices![0].amount;
        if (price! < priceRange[0] || price > priceRange[1]) return false;
      }

      // C. Vérification des calories
      if (element.calories! < caloryRange[0] ||
          element.calories! > caloryRange[1]) {
        return false;
      }

      // D. Vérification du temps de cuisson
      if (element.cookDuration! < cookDurationRange[0] ||
          element.cookDuration! > cookDurationRange[1]) {
        return false;
      }

      return true; // Le produit valide tous les critères, on le garde !
    }).toList();

    notifyListeners();
  }
}
