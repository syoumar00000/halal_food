import 'package:h_food/providers/address_provider.dart';
import 'package:h_food/providers/ads_provider.dart';
import 'package:h_food/providers/category_provider.dart';
import 'package:h_food/providers/favorite_provider.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/providers/promotion_provider.dart';
import 'package:provider/provider.dart';

final List<ChangeNotifierProvider> myProvider = [
  ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
  //ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
  ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
  ChangeNotifierProvider<AdsProvider>(create: (_) => AdsProvider()),
  ChangeNotifierProvider<PromotionProvider>(create: (_) => PromotionProvider()),
  ChangeNotifierProvider<FavoriteProvider>(create: (_) => FavoriteProvider()),
  //ChangeNotifierProvider<FaqProvider>(create: (_) => FaqProvider()),
  ChangeNotifierProvider<AddressProvider>(create: (_) => AddressProvider()),
  //ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
  //ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),
  //ChangeNotifierProvider<NotificationProvider>(create: (_) => NotificationProvider()),
  //ChangeNotifierProvider<CustomerProvider>(create: (_) => CustomerProvider()),
];
