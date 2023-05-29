import 'package:flutter/material.dart';

import '../../shop/model/product_model.dart';

@immutable
class User {
  const User({required this.id, required this.point, required this.buyingList});

  final int id;
  final int point;
  final List<Product> buyingList;

  User copyWith({int? point, List<Product>? buyingList}) {
    return User(
      id: id,
      point: point ?? this.point,
      buyingList: buyingList ?? this.buyingList,
    );
  }
}