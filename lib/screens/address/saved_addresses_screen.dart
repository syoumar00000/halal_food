import 'package:flutter/material.dart';
import 'package:h_food/providers/address_provider.dart';
import 'package:h_food/styles/spacing_style.dart';
import 'package:h_food/widgets/header/simple_header.dart';
import 'package:provider/provider.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  @override
  Widget build(BuildContext context) {
    final addressState = Provider.of<AddressProvider>(context, listen: true);

    return Scaffold(
      body: Column(
        children: [
          SimpleHeader(title: "Saved Addresses"),
          Expanded(
            child: ListView.builder(
              itemCount: addressState.addresses.length,
              itemBuilder: (ctx, index) {
                final address = addressState.addresses[index];
                // address list item
                return InkWell(
                  onTap: () {
                    /*   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> AddressFormScreen(
                            address: address,
                            ),
                          ),
                         ); */
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Container(
                      height: 120,
                      width: KscreenWidth(context),
                      decoration: BoxDecoration(
                        color: Color(0xff303030).withAlpha(10),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  address.placeDescription == "Home"
                                      ? Icons.home
                                      : Icons.local_post_office,
                                  size: 18,
                                  color: Color(0xfff45a08),
                                ),

                                SizedBox(width: 5),
                                Text(
                                  address.placeDescription,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff303030),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: Color(0xfff45a08),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Color(0xff727272),
                                ),
                              ],
                            ),
                            Text(
                              address.address1,
                              style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              address.formattedAddress,
                              style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              "/delivery-address-screen",
            ),
            //Navigator.pushReplacementNamed(context, "/edit-address-screen"),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 67, 82).withAlpha(30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 20,
                      color: Color(0xfff45a08),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Add Address",
                      style: TextStyle(
                        color: Color(0xfff45a08),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
