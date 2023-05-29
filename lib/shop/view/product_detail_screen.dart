import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peoples/common/const/app_theme.dart';
import 'package:peoples/common/layout/default_layout.dart';
import 'package:peoples/user/user_provider.dart';

import '../model/product_model.dart';

class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '포인트샵',
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Image.asset(
                      product.imgUrl,
                      fit: BoxFit.fill,
                    ))
                  ],
                ),
                _name(),
                Divider(),
                _info(),
                Divider(),
                _detail(),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () async {
                  var result;

                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // 모서리를 16로 설정
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 24,),
                        actionsPadding:
                            EdgeInsets.symmetric(vertical: 24),
                        title: Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Image.asset(product.imgUrl),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              child: Text(
                                '${product.name}을(를) 구매하시겠어요?',
                                style: AppTheme.title4,
                              ),
                            ),
                          ],
                        ),
                        content: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.backgroundPurple),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('보유'),
                                    Text('${ref.watch(userProvider).point} P'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.backgroundPurple),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('소모'),
                                    Text('${product.salePrice} P'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actions: [
                          SizedBox(
                            width: 123,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.0), // radius 조정
                                ),
                                side: BorderSide(
                                    width: 1.0,
                                    color: AppTheme.grey20), // 테두리 너비 조정
                              ),
                              onPressed: () {
                                // 취소 버튼 클릭 이벤트 처리
                                Navigator.of(context).pop();
                              },
                              child: Text('취소',
                                  style: AppTheme.title2
                                      .apply(color: AppTheme.grey50)),
                            ),
                          ),
                          SizedBox(
                            width: 123,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.0), // radius 조정
                                ),
                                backgroundColor: AppTheme.primaryPurple,
                                // side: BorderSide(width: 1.0,color: AppTheme.grey20), // 테두리 너비 조정
                              ),
                              onPressed: () {
                                // 구매하기 버튼 클릭 이벤트 처리
                                if (ref.watch(userProvider).point >=
                                    product.salePrice) {
                                  result = ref
                                      .watch(userProvider.notifier)
                                      .buyProduct(product);
                                } else {
                                  result = false;
                                }

                                Navigator.of(context).pop(result);
                              },
                              child: Text('구매하기',
                                  style: AppTheme.title2
                                      .apply(color: AppTheme.white)),
                            ),
                          ),
                        ],
                      );
                    },
                  );

                  if (result != null) {
                    if (result) {
                      Fluttertoast.showToast(
                        msg: "상품 구매가 완료되었어요.\n구매내역에서 바로 확인해보세요.",
                        toastLength: Toast.LENGTH_SHORT,
                        // 토스트 메시지의 길이 (Toast.LENGTH_SHORT 또는 Toast.LENGTH_LONG)
                        gravity: ToastGravity.BOTTOM,
                        // 토스트 메시지의 위치 (ToastGravity.TOP, ToastGravity.CENTER, ToastGravity.BOTTOM)
                        timeInSecForIosWeb: 1,
                        // iOS 및 웹에서 표시되는 시간 (초 단위)
                        backgroundColor: Colors.black54,
                        // 배경색
                        textColor: Colors.white,
                        // 텍스트 색상
                        fontSize: 16.0, // 텍스트 크기
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "상품 구매를 위한 포인트가 부족해요.",
                        toastLength: Toast.LENGTH_SHORT,
                        // 토스트 메시지의 길이 (Toast.LENGTH_SHORT 또는 Toast.LENGTH_LONG)
                        gravity: ToastGravity.BOTTOM,
                        // 토스트 메시지의 위치 (ToastGravity.TOP, ToastGravity.CENTER, ToastGravity.BOTTOM)
                        timeInSecForIosWeb: 1,
                        // iOS 및 웹에서 표시되는 시간 (초 단위)
                        backgroundColor: Colors.black54,
                        // 배경색
                        textColor: Colors.white,
                        // 텍스트 색상
                        fontSize: 16.0, // 텍스트 크기
                      );
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '구매하기',
                    style: AppTheme.title2.apply(color: AppTheme.grey00),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // 모서리를 16로 설정
                  ),
                  backgroundColor: AppTheme.primaryPurple,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _name() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 78,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(product.brand,style: AppTheme.title3,),
            Spacer(),
            Text(product.name,style: AppTheme.boldTitle1.apply(color: AppTheme.grey70),),
            Spacer(
              flex: 2,
            ),
            RichText(
              text: TextSpan(
                text: '${(product.salePercent! * 100).toInt()}% ',
                style: AppTheme.boldTitle1.apply(color: AppTheme.red),
                children: [
                  TextSpan(
                  text: '${product.salePrice} P ',
                  style: AppTheme.boldTitle1.apply(color: AppTheme.primaryPurple),
                ),
                  TextSpan(
                    text: '${product.price}',
                    style: AppTheme.title3.apply(color:AppTheme.grey30 ,decoration: TextDecoration.lineThrough),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _info() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '상품정보',
              style: AppTheme.boldTitle3,
            ),
            Text('모바일 쿠폰', style: AppTheme.body1),
            Text('구매일로부터 30일 이내 사용 가능', style: AppTheme.body1),
            Text('구매 완료 후 5-10분 메세지 발송', style: AppTheme.body1),
          ],
        ),
      ),
    );
  }

  _detail() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '상품설명',
            style: AppTheme.boldTitle3,
          ),
          Text('유의사항', style: AppTheme.body1),
          Text(
              '구매일로부터 30일\n 이내 사용 가능구매일로부터 30일 이내 사용 가능구매일로부터 30일 이내 사용 가능구매일로부터 30일 이내 사용 가능구매일로부터 30일 이내\n 사용 가능구매일로부터 30일 이내 사용 가능구매일로부터\n 30일 이내 사용 가능구매일로부터 30일 \n이내 사용 가능',
              style: AppTheme.body1),
        ],
      ),
    );
  }
}
