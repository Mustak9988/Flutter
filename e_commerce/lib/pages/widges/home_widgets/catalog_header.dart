import 'package:e_commerce/utils/color_manager.dart';
import 'package:e_commerce/utils/strings_manager.dart';
import 'package:flutter/widgets.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .start, // means text or widget will alwasy from start
      children: [
        Text(AppStrings.catalogApp,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: ColorManager.darkBluishColor,
            )),
        Text(AppStrings.trendingProducts,
            style: TextStyle(
              fontSize: 18,
              color: ColorManager.darkBluishColor,
            )),
      ],
    );
  }
}
