import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:h_food/mockups/promotion_mockup.dart';
import 'package:h_food/models/promotion_model.dart';

class PromotionProvider extends ChangeNotifier {
  List<PromotionModel> _items = [];
  UnmodifiableListView<PromotionModel> get items =>
      UnmodifiableListView(_items);

  //get promotion items
  Future<List<PromotionModel>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _items = promotionMockup;
    notifyListeners();
    return _items;
  }
}
