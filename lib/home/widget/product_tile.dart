import 'package:flutter/material.dart';

import '../../common/const/app_theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: AppTheme.grey10
                    )
                ),
                child:Image.asset('assets/images/image 27.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("빽다방"),
                  Text("앗메리카노(ICED)"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text("1,466"),
              Icon(Icons.add_circle_outline),
            ],
          )
        ],
      ),
    );
  }
}