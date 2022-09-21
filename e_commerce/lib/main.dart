import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/registration.dart';
import 'package:e_commerce/pages/widges/thems.dart';
import 'package:e_commerce/utils/all_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemes().lightTheme(context),
      darkTheme: MyThemes().darkTheme(context),
      initialRoute: AllRoutes.loginRoutes,
      debugShowCheckedModeBanner: false,
      routes: {
        AllRoutes.loginRoutes: (context) => Login(),
        AllRoutes.homeRoutes: (context) => HomePage(),
      },
    );
  }
}

