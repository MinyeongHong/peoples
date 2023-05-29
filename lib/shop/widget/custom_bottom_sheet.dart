import 'package:flutter/material.dart';
import 'package:peoples/common/const/app_theme.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;

  const CustomBottomSheet({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
      color: AppTheme.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
