import 'package:flutter/material.dart';
import 'package:h_food/configs/routes.dart';
import 'package:h_food/providers/providers.dart';
import 'package:h_food/screens/loading/loading_screen.dart';
import 'package:h_food/styles/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: myProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Halal Food',
        theme: theme(context),
        home: LoadingScreen(),
        routes: routes,
      ),
    );
  }
}
