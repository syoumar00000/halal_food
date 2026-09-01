import 'dart:convert';

class AddressModel {
  String? id;
  String address1;
  String address2;
  String city;
  String country;
  String zipCode;
  String deliveryOption;
  String instruction;
  GeoPoint? location;

  AddressModel({
    this.id,
    this.address1 = "",
    this.address2 = "",
    this.zipCode = "",
    this.city = "",
    this.country = "",
    this.deliveryOption = "",
    this.instruction = "",
    this.location,
  });

  String get formattedAddress => "$address1, $address2, $city, $country";

  //build address from google place API results
  buil(dynamic response) {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result["status"] == "OK") {
        // coordinates of location
        final geoLocation = result["result"]["geometry"]["location"];
        location = GeoPoint(geoLocation["long"], geoLocation["lat"]);

        //find address element
        final components =
            result["result"]["address_components"] as List<dynamic>;
        address1 = result["result"]["formatted_address"];
        components.forEach((c) {
          final List type = c["types"];
          if (type.contains("country")) {
            country = c["long_,name"];
          }
          if (type.contains("locality")) {
            city = c["long_name"];
          }
          if (type.contains("postal_code")) {
            zipCode = c["long_name"];
          }
        });
        return;
      }
      throw Exception(result["error_message"]);
    } else {
      throw Exception(" Failed to fetch suggestion");
    }
  }
}

class GeoPoint {
  final double longitude;
  final double latitude;
  GeoPoint(this.longitude, this.latitude);
}
