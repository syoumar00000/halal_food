import 'package:h_food/models/product_model.dart';

class CartModel {
  double total;
  List<CartItemModel> cartItems;
  String get totalString => total.toStringAsFixed(2);

  CartModel({required this.total, required this.cartItems});
}

class CartItemModel {
  ProductsModel product;
  List<String>? options;
  PriceItem selectedPrice;
  int quantity;

  CartItemModel({
    required this.product,
    this.options,
    required this.selectedPrice,
    required this.quantity,
  });
  double get total => selectedPrice.amount! * quantity.toDouble();

  // 🟢 LA CORRECTION : Voici la méthode magique pour cloner votre élément !
  CartItemModel clone() {
    return CartItemModel(
      product: product, // Le produit reste le même
      quantity: quantity, // On copie la quantité actuelle
      // On recrée un nouvel objet PriceItem pour couper le lien de référence en mémoire
      selectedPrice: PriceItem(selectedPrice.title, selectedPrice.amount),
    );
  }
}
