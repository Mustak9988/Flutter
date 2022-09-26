import 'dart:convert';
import 'package:e_commerce/pages/widges/home_widgets/catalog_header.dart';
import 'package:e_commerce/utils/all_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widges/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

//first called while widget tree is construct like android onCreate
//we have to call api if needed to load with screen first
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    //rootBundle is use to load data from asset.For more just Hober the mouse button on rootBundle txt.
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    //now I need to decode the json data
    final decodeData = jsonDecode(catalogJson);
    //convert into map
    var productsData = decodeData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AllRoutes.cartPages);
        },
        backgroundColor: context.theme.buttonColor,
        child: const Icon(CupertinoIcons.cart,
        color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          //wrap with container because I need to put a padding
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              //if else only possible inside childern list not single child or widget
              //for single we need to use ternary operator
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                const CatalogList()
                    .py16()
                    .expand() //using third party libray called valucity/x
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
