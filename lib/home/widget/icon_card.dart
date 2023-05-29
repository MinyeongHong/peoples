import 'package:flutter/material.dart';
import 'package:peoples/home/widget/basic_card.dart';

class IconCard extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Widget icon;
  final Widget? badge;

  const IconCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
    this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      widget: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  title,
                  SizedBox(
                    height: 4,
                  ),
                  content,
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
            ],
          ),
        ),
        if (badge != null)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: badge,
            ),
          ),
      ]),
    );
  }
}
