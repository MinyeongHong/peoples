import 'package:flutter/material.dart';

import '../../common/const/app_theme.dart';

class BasicCard extends StatelessWidget {
  final Widget widget;

  const BasicCard({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 1.5,
        shadowColor: AppTheme.grey10,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: widget,
        ),
      ),
    );
  }
}
