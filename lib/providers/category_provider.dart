import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:h_food/mockups/category_mockup.dart';
import 'package:h_food/models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  //liste qui contiendrra les donnees chargées
  List<CategoryModel> _items = []; //important

  // index pour memoriser le choix de lutilisateur
  int _selectedCategoryIndex = 0;
  //getters securisés
  UnmodifiableListView<CategoryModel> get items =>
      UnmodifiableListView(_items); //important
  int get selectedCategoryIndex => _selectedCategoryIndex;

  //recupere lobjet de la category active
  CategoryModel? get activeCategory =>
      _items.isNotEmpty ? _items[selectedCategoryIndex] : null;

  //charger toute les categories (simule un appel API)
  Future<List<CategoryModel>> getAll() async {
    //important
    // on simule un leger temps dattente reseau(optionnel mais realiste)
    await Future.delayed(Duration(milliseconds: 300));

    // on remplit notre liste avec le mockup
    _items = categoryMockup; //important

    // on previent l'ui que les donnees sont pretes
    notifyListeners(); //important
    return _items; //important
  }

  // fonction pour changer de categorie au clic

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }
}
