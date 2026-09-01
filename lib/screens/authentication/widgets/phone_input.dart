import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart'; // 💡 N'oubliez pas d'ajouter country_picker: ^2.0.24 dans votre pubspec.yaml !

class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  // 🟢 ÉTAPE 1 : Déclaration des variables d'état avec de vrais drapeaux émojis
  String _countryFlag = "🇸🇳"; // Émoji drapeau du Sénégal par défaut
  String _countryCode = "+221"; // Indicatif par défaut

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone Number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff303030),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟢 ÉTAPE 2 : On rend le cadre gris cliquable avec GestureDetector
            GestureDetector(
              onTap: () {
                // Déclenche l'ouverture de la feuille de route des pays
                showCountryPicker(
                  context: context,
                  showPhoneCode:
                      true, // Affiche les indicatifs téléphoniques dans la liste
                  countryListTheme: CountryListThemeData(
                    borderRadius: BorderRadius.circular(16),
                    inputDecoration: InputDecoration(
                      hintText: 'Search your country...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onSelect: (Country country) {
                    // 🟢 ÉTAPE 3 : Met à jour le widget avec le nouveau drapeau cliqué
                    setState(() {
                      _countryFlag =
                          country.flagEmoji; // Récupère le vrai émoji drapeau
                      _countryCode =
                          "+${country.phoneCode}"; // Récupère l'indicatif
                    });
                  },
                );
              },
              child: Container(
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  border: BoxBorder.fromBorderSide(BorderSide.none),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    // Affiche le drapeau dynamique (🇸🇳, 🇨🇮, 🇫🇷 etc.)
                    Text(_countryFlag, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 1),
                    // Affiche l'indicatif dynamique (+221, +225 etc.)
                    Text(
                      _countryCode,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    //  const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            // 2. Le champ de saisie du numéro de téléphone
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hint: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.grey.shade400),
                      SizedBox(width: 1),
                      Text(
                        "enter your phone number",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 0.0,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
