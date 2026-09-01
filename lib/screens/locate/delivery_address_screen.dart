import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  LatLng _currentPosition = const LatLng(5.3484, -4.0195);
  bool _isLoading = true;
  final MapController _mapController = MapController();

  String _cityName = "Locating...";
  String _countryName = "";
  String _subInformation = "Fetching neighbourhood...";

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) setState(() => _isLoading = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    if (mounted) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });

      _getAddressFromLatLng(_currentPosition);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _mapController.move(_currentPosition, 16.0);
        }
      });
    }
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}&zoom=18&addressdetails=1',
      );

      final response = await http
          .get(url, headers: {'User-Agent': 'h_food_app'})
          .timeout(
            const Duration(milliseconds: 2500),
          ); // Sécurité contre le gel de l'écran

      if (response.statusCode == 200 && mounted) {
        final data = json.decode(response.body);
        final address = data['address'];

        if (address != null) {
          setState(() {
            _cityName =
                address['city'] ??
                address['town'] ??
                address['village'] ??
                "Cocody";
            _countryName = address['country'] ?? "Côte d'Ivoire";

            String road = address['road'] ?? "";
            String suburb = address['suburb'] ?? address['neighbourhood'] ?? "";

            _subInformation = "$suburb $road".trim();
            if (_subInformation.isEmpty) _subInformation = "No street details";
          });
        }
      }
    } catch (e, stacktrace) {
      print("crash geocodeur log takef: $e");
      print("details takef : $stacktrace");

      // Sécurité si le réseau internet du téléphone est coupé ou sature
      if (mounted) {
        setState(() {
          _cityName = "Cocody";
          _countryName = "Côte d'Ivoire";
          _subInformation = "Cité des Arts, rue des écoles";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // EN-TÊTE ORANGE AVEC TEXTE DYNAMIQUE VILLE/PAYS
          Container(
            height: KscreenHeight(context) / 6,
            width: KscreenWidth(context),
            decoration: const BoxDecoration(
              color: Color(0xfff45a08),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff).withAlpha(60),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // 🟢 CORRECTION 2 : Votre en-tête affiche désormais l'adresse GPS en temps réel
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _cityName == "Locating..."
                              ? "Delivery Address"
                              : "$_cityName, $_countryName",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _subInformation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  if (!_isLoading)
                    GestureDetector(
                      onTap: _determinePosition,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffffffff).withAlpha(60),
                        ),
                        child: const Icon(
                          Icons.my_location_sharp,
                          size: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // ZONE DE CARTE OU DE CHARGEMENT
          _isLoading
              ? const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Color(0xfff45a08)),
                        SizedBox(height: 16),
                        Text(
                          "Fetching your delivery location...",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: _currentPosition,
                      initialZoom: 16.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.h_food',
                      ),

                      // 🟢 CORRECTION 3 : Votre Marqueur avec la bulle de texte noire au-dessus de l'icône
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _currentPosition,
                            width: 150,
                            height: 80,
                            alignment: Alignment.topCenter,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(185),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      _cityName == "Locating..."
                                          ? "Your Position"
                                          : _cityName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  bottom: 5,
                                  child: Icon(
                                    Icons.location_on_rounded,
                                    color: Color(0xfff45a08),
                                    size: 42,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: -30,
                        child: Container(
                          height: KscreenHeight(context) / 4,
                          width: KscreenWidth(context),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                height: 10,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xff727272),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Color(0xfff45a08),
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Text(
                                          "$_countryName, $_cityName",
                                          style: TextStyle(
                                            color: Color(0xff303030),
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          _subInformation,
                                          style: TextStyle(
                                            color: Color(0xff727272),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.edit_note,
                                      size: 30,
                                      color: Color(0xff303030),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: DefaultButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      "/home-screen",
                                    );
                                  },
                                  label: "Confirm Pin Location",
                                  backgroundColor: Color(0xfff45a08),
                                  foregroundColor: Color(0xffffffff),
                                  height: 48,
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
