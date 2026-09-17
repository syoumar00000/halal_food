import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/models/address_model.dart';
import 'package:h_food/models/place_suggestion_model.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressProvider extends ChangeNotifier {
  final List<AddressModel> _addresses = [];
  final List<PlaceSuggestionModel> _placeSuggestions = [];
  AddressModel? _selectedAddress;

  //search sugestion debounce timer
  Timer? _debounce;

  UnmodifiableListView<AddressModel> get addresses =>
      UnmodifiableListView(_addresses);
  UnmodifiableListView<PlaceSuggestionModel> get placeSugestions =>
      UnmodifiableListView(_placeSuggestions);
  AddressModel? get selectedAddress => _selectedAddress;

  //get place suggestions via google autoComplete API
  search(String searchValue) async {
    if (_debounce != null) {
      _debounce!.cancel();
    }

    //debounce search suggestions for 600 ms
    _debounce = Timer(Duration(milliseconds: 750), () async {
      final request =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchValue&types=address&key=$KGoogleKey";
      final response = await http.get(Uri.parse(request));

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print(response.body);
        if (result["status"] == "OK") {
          //compose suggestion i a list
          final results = result["predictions"]
              .map<PlaceSuggestionModel>(
                (p) => PlaceSuggestionModel(p["place_id"], p["description"]),
              )
              .toList();

          _placeSuggestions.addAll(results);
          notifyListeners();
        }
        if (result["status"] == "ZERO_RESULTS") {
          return _placeSuggestions.addAll([]);
        }
      } else {
        throw Exception("Failed to fetch suggestion");
      }
    });
  }

  //get place details via google place API
  Future<dynamic> getPlace(String placeId) async {
    final request =
        "https://maps.googleapis.com/maps/api/place/details/json?key=$KGoogleKey&place_id=$placeId";
    final response = await http.get(Uri.parse(request));
    return response;
  }

  //select or change currently delivery address
  selectAddress(AddressModel address) {
    _selectedAddress = address;
    notifyListeners();
  }

  // Mettre à jour l'adresse sélectionnée à partir de la carte (OpenStreetMap / GPS)
  void updateSelectedAddressFromMap({
    required double latitude,
    required double longitude,
    required String city,
    required String country,
    required String subInformation,
  }) {
    _selectedAddress = AddressModel(
      id: DateTime.now().millisecondsSinceEpoch
          .toString(), // Génère un ID temporaire unique
      address1: subInformation, // Détails de la rue/quartier
      address2: "",
      city: city,
      country: country,
      placeDescription:
          "Custom Location", // Label indiquant que l'adresse vient de la carte
      location: GeoPoint(
        longitude,
        latitude,
      ), // Ajustez l'ordre selon votre modèle (généralement lat, lng ou lng, lat)
    );

    // Notifie toute l'application du changement d'adresse de livraison
    notifyListeners();
  }

  Future<List<AddressModel>> getAll() async {
    _addresses.addAll([
      AddressModel(
        id: "1",
        address1: "10 Mcguire Crossing",
        address2: "15102 Sloan",
        city: "London",
        country: "United Kingdom",
        location: GeoPoint(112.320413, 29.606391),
        placeDescription: "Home",
      ),
      AddressModel(
        id: "2",
        address1: "928 Bartelt Court",
        address2: "2213 Brown Lane",
        city: "Strasbourg",
        country: "France",
        placeDescription: "Office",
        location: GeoPoint(7.6370168, 48.5347071),
      ),
      AddressModel(
        id: "3",
        address1: "928 Paris 25",
        address2: "avenue 2213",
        city: "Paris",
        country: "France",
        placeDescription: "Home",
        location: GeoPoint(7.6370168, 48.5347071),
      ),
    ]);
    if (addresses.isNotEmpty) {
      _selectedAddress = _addresses[0];
    }
    notifyListeners();
    return _addresses;
  }
}
