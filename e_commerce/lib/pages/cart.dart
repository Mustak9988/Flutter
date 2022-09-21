import 'package:e_commerce/utils/color_manager.dart';
import 'package:e_commerce/utils/strings_manager.dart';
import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.cart),
      ),
    );
  }
}