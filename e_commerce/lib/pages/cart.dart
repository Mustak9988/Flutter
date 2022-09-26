import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/utils/color_manager.dart';
import 'package:e_commerce/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(AppStrings.cart),
      ),
      body: Column(
        children: [
          // Placeholder(),
          _CartList().expand(),
          const Divider(), //use to devide between two layer or widget
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //basically we use sizebox in term of making gap or use as container
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${_cart.totalPrices}",
            style: TextStyle(
              fontSize: 24,
              color: ColorManager.darkBluishColor,
            ),
          ),
          SizedBox(
            height: 32,
            width: 100,
            child: ElevatedButton(
              onPressed: (() {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(AppStrings.cartSnack)),
                );
              }),

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  )),
              // ignore: prefer_const_constructors
              child: Text(
                AppStrings.buy,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    if (_cart.items.isEmpty) {
      return Center(
        child: Text(
          AppStrings.emptyCartMsg,
          style: TextStyle(
            color: ColorManager.darkBluishColor,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            _cart.items[index].name.toString(),
            style: TextStyle(
              color: ColorManager.darkBluishColor,
            ),
          ),
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline_rounded),
            onPressed: () {
              _cart.remove(_cart.items[index]);
              setState(() {});
            },
          ),
        ),
      );
    }
  }
}
