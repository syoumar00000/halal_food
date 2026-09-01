import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:h_food/models/address_model.dart';
import 'package:h_food/screens/locate/delivery_address_screen.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:latlong2/latlong.dart';

class AddressFormScreen extends StatefulWidget {
  final AddressModel address;
  const AddressFormScreen({super.key, required this.address});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  Completer<MapController> _controller = Completer();
  Set<Marker> _markers = {};

  TextEditingController address2ctrl = TextEditingController();
  TextEditingController instructionctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    //address marker for map
    _markers.add(
      Marker(
        point: LatLng(
          widget.address.location!.latitude,
          widget.address.location!.longitude,
        ),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final address = widget.address;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: KscreenHeight(context) / 3,
              child: DeliveryAddressScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
