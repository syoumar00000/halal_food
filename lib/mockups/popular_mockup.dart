import 'package:h_food/models/category_model.dart';
import 'package:h_food/models/product_model.dart';
import 'package:h_food/models/restaurant_model.dart';

final RestaurantModel crestaBurger = RestaurantModel(
  id: 1,
  title: "Burger King",
  icon: "assets/icons/burger-king.png",
);
final RestaurantModel crestaPizza = RestaurantModel(
  id: 2,
  title: "Pizza Hut",
  icon: "assets/icons/pizza-hut.png",
);
final RestaurantModel crestaMcDo = RestaurantModel(
  id: 3,
  title: "McDonald",
  icon: "assets/icons/mcdonald.svg",
);
final RestaurantModel crestaKfc = RestaurantModel(
  id: 4,
  title: "KFC chicken box",
  icon: "assets/icons/kfc.svg",
);
final RestaurantModel crestaChinese = RestaurantModel(
  id: 5,
  title: "China Foods",
  icon: "assets/icons/nouilles.png",
);

final List<ProductsModel> popularMockup = [
  ProductsModel(
    id: 3,
    title: "Barbecue",
    restaurant: crestaKfc,
    calories: 1200,
    prices: [
      PriceItem("small", 5.99),
      PriceItem("medium", 9.99),
      PriceItem("large", 15.99),
    ],
    options: [
      OptionItem("Drink", ["coca cola", "sprite", "fanta", "pepsi"], false),
      OptionItem("Sauce", [
        "mayonnaise",
        "ketchup",
        "mexican sauce",
        "garlic pate",
      ], true),
      OptionItem("Fried sides", ["potato fried", "yam fried"], false),
    ],
    description:
        "Lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere.",
    category: CategoryModel(id: 2),
    cookDuration: 60,
    discount: 0,
    featured: true,
    image: "assets/images/items/barbecue1.jpg",
    favoriteCount: 12,
    rate: 4.6,
    orderCount: 188,
  ),
  ProductsModel(
    id: 6,
    title: "Full Burger",
    restaurant: crestaBurger,
    calories: 2400,
    prices: [
      PriceItem("small", 3.99),
      PriceItem("medium", 8.99),
      PriceItem("large", 9.99),
    ],
    options: [
      OptionItem("Sauce", [
        "mayonnaise",
        "ketchup",
        "mexican sauce",
        "garlic pate",
      ], true),
    ],
    description:
        "Lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere.",
    category: CategoryModel(id: 3),
    cookDuration: 30,
    discount: 0,
    featured: false,
    image: "assets/images/items/burger3.jpg",
    favoriteCount: 5,
    rate: 4.6,
    orderCount: 56,
  ),
  ProductsModel(
    id: 11,
    title: "Chinese Food 1",
    restaurant: crestaChinese,
    calories: 900,
    prices: [
      PriceItem("Small", 1.99),
      PriceItem("Medium", 3.99),
      PriceItem("Large", 4.99),
    ],
    options: [],
    description:
        "Lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere.",
    category: CategoryModel(id: 5),
    cookDuration: 30,
    discount: 0,
    featured: false,
    image: "assets/images/items/chinese1.jpg",
    favoriteCount: 5,
    rate: 4.8,
    orderCount: 53,
  ),

  ProductsModel(
    id: 31,
    title: "Sandwich S",
    restaurant: crestaMcDo,
    calories: 950,
    prices: [
      PriceItem("small", 0.89),
      PriceItem("medium", 1.19),
      PriceItem("large", 2.66),
    ],
    options: [
      OptionItem("Sauce", [
        "mayonnaise",
        "ketchup",
        "mexican sauce",
        "garlic pate",
      ], true),
    ],
    description:
        "Lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere.",
    category: CategoryModel(id: 13),
    cookDuration: 10,
    discount: 0,
    featured: false,
    image: "assets/images/items/sandwich2.jpg",
    favoriteCount: 19,
    rate: 4.8,
    orderCount: 217,
  ),
  ProductsModel(
    id: 26,
    title: "Silver Pizza",
    restaurant: crestaPizza,
    calories: 1100,
    prices: [
      PriceItem("small", 5.99),
      PriceItem("medium", 6.99),
      PriceItem("large", 7.99),
    ],
    options: [
      OptionItem("Sauce", [
        "mayonnaise",
        "ketchup",
        "mexican sauce",
        "garlic pate",
      ], true),
    ],
    description:
        "Lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere.",
    category: CategoryModel(id: 12),
    cookDuration: 45,
    discount: 0,
    featured: false,
    image: "assets/images/items/pizza1.jpg",
    favoriteCount: 7,
    rate: 4.4,
    orderCount: 82,
  ),
];
