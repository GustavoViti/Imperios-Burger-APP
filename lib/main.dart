import 'package:flutter/material.dart';
import 'package:imperios/modules/splash/splash_page.dart';
import 'modules/home/home_page.dart';
import 'core/theme/app_theme.dart';
import 'modules/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamburgueria',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      home: const SplashPage(),
    );
  }
}
