import 'package:flutter/material.dart';
import 'package:h_food/screens/account/widgets/account_header.dart';
import 'package:h_food/screens/authentication/widgets/phone_input.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/input/outline_input.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String? _selectedGender = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          const AccountHeader(title: "Edit Profile"),
          const SizedBox(height: 130),
          // L'Expanded ici permet au SingleChildScrollView d'occuper tout le reste de l'écran proprement
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ), // Ajoute des marges sur les côtés du formulaire
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ligne pour mettre le Prénom et le Nom côte à côte
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ─── PREMIER NOM (EXPANDED DANS LA ROW) ───
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff303030),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Plus de Expanded ici ! Le champ prend toute la largeur de sa moitié d'écran.
                            OutlineInput(),
                          ],
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ), // Espace horizontal entre les deux champs
                      // ─── DEUXIÈME NOM (EXPANDED DANS LA ROW) ───
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff303030),
                              ),
                            ),
                            const SizedBox(height: 8),
                            OutlineInput(),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Text(
                    "Email Address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff303030),
                    ),
                  ),
                  SizedBox(height: 8),
                  OutlineInput(),
                  SizedBox(height: 10),
                  PhoneInput(),
                  SizedBox(height: 10),
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff303030),
                    ),
                  ),
                  SizedBox(height: 8),
                  OutlineInput(suffix: Icon(Icons.calendar_month)),
                  SizedBox(height: 10),
                  Text(
                    "Gender",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff303030),
                    ),
                  ),
                  SizedBox(height: 8),
                  RadioGroup<String>(
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    child: const Row(
                      children: [
                        // OPTION MALE
                        Radio<String>(
                          value: "Male",
                          activeColor: Color(0xfff45a08),
                          // Plus besoin de groupValue ni de onChanged ici !
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff303030),
                          ),
                        ),

                        SizedBox(width: 30),

                        // OPTION FEMALE
                        Radio<String>(
                          value: "Female",
                          activeColor: Color(0xfff45a08),
                          // Plus besoin de groupValue ni de onChanged ici !
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff303030),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  DefaultButton(
                    onPressed: () {},
                    label: "Save",
                    backgroundColor: Color(0xfff45a08),
                    foregroundColor: Color(0xffffffff),
                    height: 54,
                    width: double.infinity,
                  ),

                  // Vous pouvez maintenant ajouter la suite de votre formulaire ici (Email, Téléphone)
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
