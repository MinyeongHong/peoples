import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peoples/common/const/app_theme.dart';
import 'package:peoples/common/layout/default_layout.dart';
import 'package:peoples/shop/view/history_screen.dart';
import 'package:peoples/shop/view/shop_detail_screen.dart';
import 'package:peoples/user/user_provider.dart';

List<Map<String, String>> categoryList = [
  {"치킨/피자": "assets/images/poultry_leg.png"},
  {"편의점": "assets/images/convenience.png"},
  {"커피/음료": "assets/images/coffee.png"}
];

class ShopCategoryScreen extends ConsumerWidget {
  ShopCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: "포인트샵",
      action: TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HistoryScreen()));
        },
        child: Text('구매내역',
            style: AppTheme.title2.apply(color: AppTheme.primaryPurple)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '현재 ${ref.watch(userProvider).point}P 보유 중이에요',
                    style: AppTheme.title0,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '어떤 상품',
                          style: AppTheme.title0
                              .apply(color: AppTheme.primaryPurple),
                        ),
                        const TextSpan(
                            text: '을 구매할까요?', style: AppTheme.title0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3, // 열의 개수를 3으로 설정
                children: List.generate(12, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: _IconTile(
                        name: categoryList[index%3].keys.first,
                        url: categoryList[index%3].values.first,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ShopDetailScreen(category:categoryList[2])));
                        }),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _IconTile(
      {required String name,
      required String url,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          color: AppTheme.white,
          border: Border.all(color: AppTheme.grey10),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  url,
                  fit: BoxFit.scaleDown,
                )),
            Text(
              name,
              style: AppTheme.title3,
            )
          ],
        ),
        // 다른 속성과 위젯들을 추가할 수 있습니다.
      ),
    );
  }
}
