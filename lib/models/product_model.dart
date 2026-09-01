// lib/models/ProductsMockup_model.dart
import 'package:h_food/configs/app_config.dart';

import 'category_model.dart';

class ProductsModel {
  final int? id;
  final String? title;
  final String? description;
  final int? cookDuration;
  final int? calories;
  CategoryModel? category;
  final double? discount; // Exemple: 0.10 pour 10%
  final String? image;
  final bool? featured;
  final double? rate;
  final int? favoriteCount;
  final int? orderCount;

  // Utilisation de nos classes définies plus bas
  final List<PriceItem>? prices;
  final List<OptionItem>? options;

  //bool isLiked; // État local pour le cœur

  ProductsModel({
    this.id,
    this.title,
    this.description,
    this.cookDuration,
    this.calories,
    this.category,
    this.discount,
    this.image,
    this.featured,
    this.rate,
    this.favoriteCount,
    this.orderCount,
    this.prices,
    this.options,
    //this.isLiked = false,
  });

  // Calcule le prix net après réduction
  double calculateFinalPrice(PriceItem priceItem) {
    return priceItem.amount! * (1 - discount!);
  }

  // Retourne le pourcentage de réduction sous forme d'entier (ex: 15)
  int get discountPercentage {
    return (discount! * 100).round();
  }

  // Retourne le prix formaté proprement pour l'affichage textuel (ex: "8.50 €")
  String getFormattedPrice(PriceItem priceItem) {
    final finalPrice = calculateFinalPrice(priceItem);
    return "$KCurrency${finalPrice.toStringAsFixed(2)}";
  }

  // Récupère toutes les options sélectionnées par le client
  List<String> getSelectedOptions() {
    List<String> selected = [];
    for (var option in options!) {
      if (option.selected != null) {
        selected.addAll(option.selected!);
      }
    }
    return selected;
  }
}

// Modèle pour gérer les déclinaisons de prix (Normal, Maxi...)
class PriceItem {
  final String? title;
  final double? amount;

  PriceItem(this.title, this.amount);
}

// Modèle pour gérer les choix de suppléments ou de cuisson
class OptionItem {
  final String? title;
  final List<String>?
  values; // Liste des choix possibles: ["Ketchup", "Mayonnaise", "BBQ"]
  final bool? multiple; // Choix multiples autorisés ou non
  List<String>? selected; // Stocke ce que l'utilisateur a coché

  OptionItem(
    this.title,
    this.values,
    this.multiple, {
    this.selected, // Ajout de ce paramètre optionnel entre accolades
  }) {
    // Évite l'erreur d'écrasement : on n'initialise QUE si selected est nul
    if (selected == null) {
      if (multiple == false) {
        selected = [""];
      } else {
        selected = [];
      }
    }
  }
}
