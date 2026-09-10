// lib/providers/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:h_food/models/cart_model.dart';
import 'package:h_food/models/product_model.dart';

class CartProvider with ChangeNotifier {
  // Initialisation d'un panier vide par défaut
  final CartModel _cart = CartModel(total: 0.0, cartItems: []);

  // Variables de travail pour l'écran de personnalisation du produit
  CartItemModel? _tempCartItem;
  CartItemModel? _currentCartItem;
  final bool _loading = false;

  // Getters publics
  CartModel get cart => _cart;
  int get cartLength => _cart.cartItems.length;
  CartItemModel? get tempCartItem => _tempCartItem;
  bool get loading => _loading;

  // Initialise l'article temporaire (crée une copie pour éviter de modifier le panier par erreur)
  void setTempCartItem(CartItemModel item) {
    _tempCartItem = item
        .clone(); // Utilisation d'un clone pour la sécurité des données
    _currentCartItem = item;
    notifyListeners();
  }

  // 1. CHANGEMENT DE TAILLE (Prix)
  void selectPrice(PriceItem price) {
    if (_tempCartItem != null) {
      _tempCartItem!.selectedPrice = price;
      notifyListeners();
    }
  }

  // 2. GESTION DES SUPPLÉMENTS ET SAUCES
  void setOption(OptionItem option, String value, {bool checked = false}) {
    // if (option.selected == null) option.selected = [];
    option.selected ??= [];

    if (option.multiple == false) {
      option.selected = [value]; // Choix unique : remplace tout
    } else {
      // Choix multiples
      if (checked) {
        if (!option.selected!.contains(value)) option.selected!.add(value);
      } else {
        option.selected!.remove(value);
      }
    }
    notifyListeners();
  }

  // 3. BOUTONS QUANTITÉ + ET -
  void changeQuantity(int value) {
    if (_tempCartItem != null) {
      if ((_tempCartItem!.quantity + value) > 0) {
        _tempCartItem!.quantity += value;
        notifyListeners();
      }
    }
  }

  // 3b. LA CORRECTION : MODIFICATION CIBLÉE DE LA QUANTITÉ DANS LE PANIER
  void updateCartItemQuantity(CartItemModel item, int value) {
    final index = _cart.cartItems.indexWhere(
      (element) =>
          element.product.id == item.product.id &&
          element.selectedPrice.title == item.selectedPrice.title,
    );

    if (index != -1) {
      final int newQuantity = _cart.cartItems[index].quantity + value;

      if (newQuantity <= 0) {
        // Si la quantité tombe à 0, on retire l'élément du panier
        _cart.cartItems.removeAt(index);
      } else {
        // On met à jour uniquement la quantité
        _cart.cartItems[index].quantity = newQuantity;
      }

      // La méthode _updateCartTotal prend déjà en compte (amount * quantity) !
      _updateCartTotal();
    }
  }

  // 4. AJOUT OU MISE À JOUR DU PANIER
  void addToCart(CartItemModel item) {
    final index = _cart.cartItems.indexWhere(
      (element) => element.product.id == item.product.id,
    );

    if (index == -1) {
      _cart.cartItems.add(item); // N'existe pas : on l'ajoute
    } else {
      _cart.cartItems[index] = item; // Existe déjà : on le remplace
    }

    _updateCartTotal(); // Calcule le prix après modification
  }

  // 5. SUPPRESSION DU PANIER (Correction du bug d'ordre d'exécution)
  void removeFromCart(CartItemModel item) {
    _cart.cartItems.removeWhere(
      (element) => element.product.id == item.product.id,
    );
    _updateCartTotal(); // 🟢 CORRECTION : On recalcule le prix APRÈS avoir supprimé l'élément
  }

  // 6. VIDER LE PANIER (Correction du crash du reduce)
  void clearCart() {
    _cart.cartItems.clear();
    _cart.total = 0.0; //  CORRECTION : Évite le plantage du panier vide
    notifyListeners();
  }

  // 7. RECHERCHE D'UN ARTICLE DÉJÀ DANS LE PANIER
  CartItemModel? findCartItem(ProductsModel product) {
    for (var item in _cart.cartItems) {
      if (item.product.id == product.id) {
        _tempCartItem = item;
        _currentCartItem = item;
        return item;
      }
    }
    return null;
  }

  // FONCTION PRIVÉE DE CALCUL DU TOTAL DE MANIÈRE SÉCURISÉE
  void _updateCartTotal() {
    //  CORRECTION : .fold() démarre à 0.0 et ne crashe jamais, même si la liste est vide !
    _cart.total = _cart.cartItems.fold<double>(
      0.0,
      (previousValue, item) =>
          previousValue + (item.selectedPrice.amount! * item.quantity),
    );
    notifyListeners();
  }
}
