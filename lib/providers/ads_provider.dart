import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:h_food/mockups/ads_mockup.dart';
import 'package:h_food/models/ads_model.dart';

class AdsProvider extends ChangeNotifier {
  List<AdsModel> _items = [];
  UnmodifiableListView<AdsModel> get items => UnmodifiableListView(_items);

  //get ads items
  Future<List<AdsModel>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _items = adsMockup;
    notifyListeners();
    return _items;
  }
}
