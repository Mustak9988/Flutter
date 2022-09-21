import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/utils/color_manager.dart';
import 'package:e_commerce/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorManager.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
         
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image.toString()),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth, //media curey screen width
                child: Column(
                  children: [
                    catalog.name!.text.xl4
                        .color(ColorManager.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc!.text
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            SizedBox(
              width: 100.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ColorManager.darkBluishColor,
                    ),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    )),
                child: AppStrings.buy.text.make(),
              ), //.wh(100, 50), means sizeBox
            )
          ],
        ).p32(),
      ),
    );
  }
}
