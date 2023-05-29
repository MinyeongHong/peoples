import 'package:flutter/material.dart';

import '../../common/const/app_theme.dart';
import '../model/product_model.dart';

class HistoryItem extends StatefulWidget {
  final Product product;
  final Function() onTap;

  const HistoryItem({Key? key, required this.product, required this.onTap}) : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    widget.product.imgUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.brand,
                      style: AppTheme.title3,
                    ),
                    Text(
                      widget.product.name,
                      style: AppTheme.boldTitle2,
                    )
                  ],
                ),
              ],
            ),
            IconButton(icon: Icon(Icons.download_rounded), onPressed:widget.onTap,)
          ]),
    );
  }
}
