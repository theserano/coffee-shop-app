import 'package:coffee_shop_app/data/providers/shop.dart';
import 'package:coffee_shop_app/data/providers/coffee_order.dart';
import 'package:coffee_shop_app/data/providers/theme_provider.dart';
import 'package:coffee_shop_app/ui/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => Shop()),
      ChangeNotifierProvider(create: (context) => Coffee())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: const Register(),
        );
      },
    );
  }
}
