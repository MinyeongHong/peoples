import 'package:flutter/material.dart';

import '../../common/const/app_theme.dart';
import '../model/brand_model.dart';

class BrandIcon extends StatelessWidget {
  final Brand brand;
  final bool hasName;
  final double iconSize;

  const BrandIcon(
      {Key? key, required this.brand, this.hasName = true, this.iconSize = 26})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: iconSize * 1.8,
            width: iconSize * 1.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppTheme.grey10),
            ),
            child: Center(
              child: SizedBox(
                width: iconSize,
                height: iconSize,
                child: Image.asset(
                  brand.url,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          if (hasName)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
              child: Text(
                brand.name,
                style: AppTheme.body2,
              ),
            )
        ],
    );
  }
}
