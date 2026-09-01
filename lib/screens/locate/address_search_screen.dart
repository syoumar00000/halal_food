import 'package:flutter/material.dart';
import 'package:h_food/models/address_model.dart';
import 'package:h_food/providers/address_provider.dart';
import 'package:h_food/screens/locate/address_form_screen.dart';
import 'package:provider/provider.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({super.key});

  @override
  State<AddressSearchScreen> createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final addressState = Provider.of<AddressProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      onChanged: (String value) {
                        setState(() {
                          addressState.search(value);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search your address",
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  CloseButton(color: Colors.black),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: addressState.placeSugestions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final suggestion = addressState.placeSugestions[index];
                    return InkWell(
                      onTap: () async {
                        final placeDetails = await addressState.getPlace(
                          suggestion.placeId,
                        );
                        final address = AddressModel()..buil(placeDetails);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddressFormScreen(address: address),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Icon(
                              Icons.near_me_outlined,
                              size: 20,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 10),
                            Flexible(child: Text(suggestion.description)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
