import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peoples/common/layout/default_layout.dart';
import 'package:peoples/home/widget/gauge.dart';
import 'package:peoples/home/widget/icon_card.dart';
import 'package:peoples/home/widget/square_card.dart';
import 'package:peoples/home/widget/product_tile.dart';
import 'package:peoples/shop/view/shop_category_screen.dart';
import 'package:peoples/user/user_provider.dart';

import '../../common/const/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPurple,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundPurple,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.account_circle_rounded),
            ),
            RichText(
              text: TextSpan(
                text: '${ref.watch(userProvider).point} P',
                style: AppTheme.boldTitle3,
                children: const <TextSpan>[
                  TextSpan(
                    text: ' 모았어요!',
                    style: AppTheme.title3,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: AppTheme.grey70,
            )
          ],
        ),
        foregroundColor: AppTheme.grey30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 315,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.location_on_rounded,
                                  size: 16,
                                  color: AppTheme.white,
                                ),
                              ),
                              TextSpan(
                                text: '현재 ',
                                style: AppTheme.boldTitle2
                                    .apply(color: AppTheme.primaryDisabled),
                              ),
                              TextSpan(
                                text: '강남구 서초동 체크인',
                                style: AppTheme.boldTitle2
                                    .apply(color: AppTheme.grey00),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '오늘의 걸음 수는 ',
                                style: AppTheme.subTitle
                                    .apply(color: AppTheme.lightPurple),
                              ),
                              TextSpan(
                                text: '5,000 ',
                                style: AppTheme.boldSubTitle
                                    .apply(color: AppTheme.grey00),
                              ),
                              TextSpan(
                                text: '이에요.',
                                style: AppTheme.subTitle
                                    .apply(color: AppTheme.lightPurple),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 200,
                            width: 250,
                            child: CustomGauge(progress: 0.5),
                          ),
                        ),
                        Container(
                          child: Image.asset('assets/images/main_azi_01.png'),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Text("휴식하기"),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SquareCard(
                    width: 149,
                    height: 152,
                    title: Text(
                      '바로적립',
                      style: AppTheme.boldTitle1,
                    ),
                    content: RichText(
                      text: TextSpan(
                        text: '영상 광고 시청 하고',
                        style: AppTheme.body1,
                        children: const <TextSpan>[
                          TextSpan(text: '20P', style: AppTheme.boldBody1),
                          TextSpan(text: ' 받기'),
                        ],
                      ),
                    ),
                    badge: '0/10',
                    icon: FlutterLogo(
                      size: 40,
                    )),
                SquareCard(
                    width: 149,
                    height: 152,
                    title: Text(
                      '미션적립',
                      style: AppTheme.boldTitle1,
                    ),
                    content: Text(
                      '원하는 미션 골라서 참여하고 포인트 받기',
                      style: AppTheme.body1,
                      maxLines: null,
                    ),
                    badge: '무제한',
                    icon: FlutterLogo(
                      size: 40,
                    )),
              ],
            ),
            IconCard(
              title: Text(
                "일일미션",
                style: AppTheme.boldTitle1,
              ),
              content: RichText(
                text: TextSpan(
                  text: '돌림판 돌리고 최대 ',
                  style: AppTheme.body1,
                  children: const <TextSpan>[
                    TextSpan(text: '500P', style: AppTheme.boldBody1),
                    TextSpan(text: ' 받기'),
                  ],
                ),
              ),
              icon: FlutterLogo(
                size: 30,
              ),
            ),
            IconCard(
              title: Text(
                "휴식하기",
                style: AppTheme.boldTitle1,
              ),
              content: Text(
                "아지트에서 특별한 휴식을 경험하세요!",
                style: AppTheme.body1,
              ),
              icon: FlutterLogo(
                size: 30,
              ),
              badge: Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightPurple,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Text("NEW",
                    style: AppTheme.boldBody1
                        .apply(color: AppTheme.primaryPurple)),
              ),
            ),
            _largeTile(context: context),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SquareCard(
                title: Text("이벤트", style: AppTheme.boldSubTitle),
                content: Text("42일간 진행되는 특급 혜택!\n포인트샵 50% 할인 이벤트",
                    style: AppTheme.boldTitle2),
                icon: FlutterLogo(
                  size: 120,
                ),
                marker: Text("1 / 2"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: AppTheme.grey70,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '새로워진 아지트, 어떻게 사용하나요?',
                          style: AppTheme.body1.apply(color: AppTheme.grey20),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '아지트 이용가이드',
                          style:
                              AppTheme.boldTitle1.apply(color: AppTheme.white),
                        ),
                      ],
                    ),
                    FlutterLogo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: AppTheme.primaryPurple,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '하루 최대 10P 보너스 포인트 받는 법',
                  style: AppTheme.boldBody1.apply(color: AppTheme.white),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: AppTheme.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _largeTile({
    BuildContext? context,
  }) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 1.5,
        shadowColor: AppTheme.grey10,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("포인트샵", style: AppTheme.boldSubTitle),
                  Text("차곡차곡 모은 포인트로\n다른 사람들은 아래 상품 구매했어요",
                      style: AppTheme.boldTitle2),
                  SizedBox(
                    height: 14,
                  ),
                  ProductTile(),
                  ProductTile(),
                  ProductTile(),
                  SizedBox(
                    height: 14,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // radius 조정
                    ),
                    side: BorderSide(
                        width: 1.0, color: AppTheme.grey20), // 테두리 너비 조정
                  ),
                  onPressed: () {
                    Navigator.of(context!).push(MaterialPageRoute(
                        builder: (_) => ShopCategoryScreen()));
                  },
                  child: Text(
                    '포인트샵 바로가기',
                    style: AppTheme.title2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
