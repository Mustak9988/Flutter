import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item item;

  const AddToCart({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _catalogModel = CatalogModel();
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool inCart = _cart.items.contains(widget.item) ?? false;
    return ElevatedButton(
      onPressed: () {
        //check whether the same item is in cart or not
        if (!inCart) {
          inCart = true;
          _cart.catalog = _catalogModel;
          _cart.add(widget.item);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: inCart ? const Icon(Icons.done) : const Icon(Icons.add),
    );
  }
}
