import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/providers/address_provider.dart';
import 'package:h_food/providers/category_provider.dart';
import 'package:h_food/providers/product_provider.dart';
import 'package:h_food/providers/promotion_provider.dart';
import 'package:h_food/screens/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _initialiseApp();
  }

  Future<void> _initialiseApp() async {
    try {
      // 1. On lance un délai minimum pour laisser le temps à l'animation de s'afficher
      await Future.delayed(const Duration(milliseconds: 1500));

      // 2. LOGIQUE EN SÉQUENCE : On attend chaque méthode l'une après l'autre avec "await"
      // Cette écriture accepte TOUS les types de retour (void, Null, Future) sans jamais planter !
      await context.read<CategoryProvider>().getAll();
      await context.read<ProductProvider>().getAll();
      await context.read<PromotionProvider>().getAll();
      await context.read<AddressProvider>().getAll();
      //await context.read<PaymentProvider>().getAllPaymentMethod();
      //await context.read<OrderProvider>().getAll();
      //await context.read<CustomerProvider>().get();
      //await context.read<NotificationProvider>().getAll();
      //await context.read<FaqProvider>().getAll();

      // 3. Sécurité BuildContext : On vérifie que l'écran est toujours affiché avant de naviguer
      if (!mounted) return;

      // 4. NAVIGATION : Tout est en mémoire, on passe à l'onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } catch (e) {
      print("Erreur d'initialisation de l'application Let's Eat: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(KAppLogo, width: 180),
            SizedBox(height: 16),
            Text(
              KAppTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
