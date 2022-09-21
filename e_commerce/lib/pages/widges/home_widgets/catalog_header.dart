import 'package:e_commerce/utils/strings_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

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
              color: context.theme.accentColor,
            )),
        Text(AppStrings.trendingProducts,
            style: TextStyle(
              fontSize: 18,
              color:context.theme.accentColor,
            )),
      ],
    );
  }
}
