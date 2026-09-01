import 'package:flutter/material.dart';
import 'package:h_food/screens/authentication/widgets/agrement_line.dart';
import 'package:h_food/screens/authentication/widgets/divider_bloc.dart';
import 'package:h_food/screens/authentication/widgets/option_bloc.dart';
import 'package:h_food/screens/authentication/widgets/phone_input.dart';
import 'package:h_food/screens/authentication/widgets/social_sign.dart';
import 'package:h_food/screens/authentication/widgets/text_with_input_text.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool isSignInActive = true;

  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
    const Color inactiveGrey = Color(0xff727272);
    const Color lineGrey = Color(0xffe0e0e0);
    return Transform.translate(
      offset: Offset(0, -50),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: KscreenWidth(context) - 60,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // 🟢 LA BARRE D'ONGLETS INTERACTIVE AVEC LES TRAITS DYNAMIQUES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ONGLET SIGN IN
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignInActive = true; // Active le Sign In au clic
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isSignInActive
                                    ? brandOrange
                                    : inactiveGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 3,
                              color: isSignInActive
                                  ? brandOrange
                                  : lineGrey, // Orange si actif, gris si inactif
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ONGLET SIGN UP
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignInActive = false; // Active le Sign Up au clic
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: !isSignInActive
                                    ? brandOrange
                                    : inactiveGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 3,
                              color: !isSignInActive
                                  ? brandOrange
                                  : lineGrey, // Orange si actif, gris si inactif
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // TEXTE DE BIENVENUE DYNAMIQUE
                Center(
                  child: Text(
                    isSignInActive ? "Welcome Back !" : "Create Your Account",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff303030),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // 🟢 LE CONTENU DU FORMULAIRE DYNAMIQUE
                // Si l'onglet Sign Up est actif, on affiche en plus le champ "Full Name"
                if (!isSignInActive) ...[
                  TextWithInputText(
                    label: "Full Name",
                    icon: Icon(Icons.person_outline),
                    hint: "enter your full name",
                  ),
                ],
                TextWithInputText(
                  label: "Email Address",
                  icon: Icon(Icons.email_outlined),
                  hint: "enter your email",
                ),

                if (!isSignInActive) ...[PhoneInput()],
                const SizedBox(height: 10),
                TextWithInputText(
                  isPassword: true,
                  label: "Password",
                  icon: Icon(Icons.lock_outline),
                  hint: "enter your password",
                  hideIcon: Icon(Icons.visibility_off),
                ),

                if (!isSignInActive) ...[
                  TextWithInputText(
                    label: "Confirm Password",
                    icon: Icon(Icons.lock_outline),
                    hint: "enter your password",
                    isPassword: true,
                    hideIcon: Icon(Icons.visibility_off),
                  ),
                  AgrementLine(),
                ],
                const SizedBox(height: 5),
                // REMEMBER ME (Affiché uniquement pour le Sign In)
                if (isSignInActive) OptionBloc(),
                SizedBox(height: 15),
                DefaultButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home-screen");
                  },
                  label: isSignInActive ? "Sign In" : "Sign Up",
                  backgroundColor: brandOrange,
                  foregroundColor: Color(0xffffffff),
                  width: double.infinity,
                  height: 48,
                ),
                SizedBox(height: 15),
                if (isSignInActive) ...[DividerBloc()],
                SizedBox(height: 10),
                if (isSignInActive) SocialSign(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
