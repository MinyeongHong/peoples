import 'package:flutter/material.dart';
import 'package:peoples/shop/model/product_model.dart';
import 'package:riverpod/riverpod.dart';

import 'model/user_model.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(
          const User(
            id: 1,
            point: 5000,
            buyingList: [],
          ),
        );

  bool buyProduct(Product product) {
    try {
      final updatedBuyingList = List<Product>.from(state.buyingList);
      updatedBuyingList.add(product);

      state = state.copyWith(
          buyingList: updatedBuyingList,
          point: state.point - product.salePrice);
    } catch (e) {
      return false;
    }

    return true;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
