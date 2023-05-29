import 'package:flutter/material.dart';

import '../../common/const/app_theme.dart';
import '../model/brand_model.dart';

class BottomSheetTile extends StatelessWidget {
  final Widget? leading;
  final Function()? onTap;
  final Widget title;
  final Icon? trailing;

  const BottomSheetTile(
      {Key? key,
      this.leading,
      required this.title,
      this.trailing,
      this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: title,
        onTap: onTap,
        leading: leading,
        trailing: trailing
      ),
    );
  }
}
