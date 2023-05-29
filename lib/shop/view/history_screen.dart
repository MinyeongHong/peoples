import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peoples/user/user_provider.dart';

import '../../common/const/app_theme.dart';
import '../../common/layout/default_layout.dart';
import '../model/product_model.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/history_item.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '구매내역',
      child: ref.watch(userProvider).buyingList.isEmpty
          ? Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 1,),
                  Image.asset('assets/images/coffee_azi.png'),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '아직 구매내역이 비어있어요.\n다양한 상품 할인 받고 구매해보세요.',
                    textAlign: TextAlign.center,
                    style: AppTheme.title3.apply(color: Color(0xff878C9E),),

                  ),
                  Spacer(flex: 2,),
                ],
              ),
            )
          : ListView(
              children: [
                ...List.generate(
                  ref.watch(userProvider).buyingList.length,
                  (index) => HistoryItem(
                    product: ref.watch(userProvider).buyingList[index],
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return CustomBottomSheet(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.77,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.55,
                                        child: Image.asset(
                                          'assets/images/image 26.png',
                                          fit: BoxFit.contain,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: SizedBox(
                                        width: 327,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      100.0), // radius 조정
                                            ),
                                            backgroundColor:
                                                AppTheme.primaryPurple,
                                          ),
                                          onPressed: () {
                                            // if (ref.watch(userProvider).point >=
                                            //     product.salePrice) {
                                            //   result = ref
                                            //       .watch(userProvider.notifier)
                                            //       .buyProduct(product);
                                            // } else {
                                            //   result = false;
                                            // }
                                            //
                                            // Navigator.of(context).pop();
                                          },
                                          child: Text('이미지 다운로드',
                                              style: AppTheme.title2.apply(
                                                  color: AppTheme.white)),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
