import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/pages/home_details.dart';
import 'package:e_commerce/pages/widges/home_widgets/add_to_cart.dart';
import 'package:e_commerce/pages/widges/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      //Container modified to Vbox
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image.toString(),
            ),
          ),
          Expanded(
              //expanded means it takes the whole available screen and Flex means like portion or area given to specific widget
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name!.text.lg
                  .color(
                    context.accentColor,
                  )
                  .bold
                  .make(),
              catalog.desc!.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(item: catalog)
                ],
              ).pOnly(right: 8.0) //padding only
            ],
          ))
        ],
      ),
    )
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16(); //padding y axis
  }
}

