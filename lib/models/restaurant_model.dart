class RestaurantModel {
  int? id;
  String? title;
  String? icon;
  String? deliveryTime;
  double? rate;
  String? image;
  //CategoryModel? category;

  RestaurantModel({
    this.id,
    this.title,
    this.icon,
    this.deliveryTime,
    this.rate,
    this.image,
  });
}

/* Text(
  widget.product.getFormattedPrice(widget.product.prices![0]),
  style: const TextStyle(color: Colors.green, fontSize: 20),
); */
