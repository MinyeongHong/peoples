import 'package:flutter/material.dart';
import 'package:peoples/home/widget/basic_card.dart';

import '../../common/const/app_theme.dart';

class SquareCard extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Widget? icon;
  final Widget? marker;
  final String? badge;
  final double? width;
  final double? height;

  const SquareCard({
    required this.title,
    required this.content,
    this.icon,
    this.marker,
    this.badge,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      widget: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      title,
                      SizedBox(
                        width: 4,
                      ),
                      if (badge != null)
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.backgroundPurple,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            badge!,
                            style: AppTheme.body1,
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  content,
                ],
              ),
              if (icon != null) icon!,
              Align(
                alignment: Alignment.bottomLeft,
                child: marker,
              )
            ],
          ),
        ),
      ),
    );
  }
}
