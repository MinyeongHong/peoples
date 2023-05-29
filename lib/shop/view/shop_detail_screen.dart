import 'package:flutter/material.dart';
import 'package:peoples/common/layout/default_layout.dart';
import 'package:peoples/shop/model/brand_model.dart';
import 'package:peoples/shop/model/product_model.dart';
import 'package:peoples/shop/view/product_detail_screen.dart';

import '../../common/const/app_theme.dart';
import '../widget/bottom_sheet_tile.dart';
import '../widget/brand_icon.dart';
import '../widget/custom_bottom_sheet.dart';

class ShopDetailScreen extends StatelessWidget {
  final Map<String, String> category;

  const ShopDetailScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '커피/음료',
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: false,
                        builder: (BuildContext context) {
                          return CustomBottomSheet(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: category.keys.first,
                                            style: AppTheme.title0),
                                        WidgetSpan(
                                          child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                              category.values.first,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                  12,
                                  (index) {
                                    return Column(
                                      children: [
                                        BottomSheetTile(
                                          title: Text(
                                            mockBrands[index % 4].name,
                                            style: AppTheme.title2.apply(
                                                color: AppTheme.grey50),
                                          ),
                                          leading: BrandIcon(
                                            brand: mockBrands[index % 4],
                                            iconSize: 18,
                                            hasName: false,
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: AppTheme.grey30,
                                            size: 12,
                                          ),
                                        ),
                                        Divider(
                                          color: AppTheme.grey10,
                                          height: 1,
                                          thickness: 1,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, top: 4, bottom: 12),
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: AppTheme.grey10),
                            ),
                            child: Icon(Icons.menu),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 2),
                            child: Text(
                              '카테고리',
                              style: AppTheme.body2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ...List.generate(
                    10,
                    (index) => Padding(
                      padding:
                          const EdgeInsets.only(right: 16, top: 4, bottom: 12),
                      child: BrandIcon(brand: mockBrands[index % 4]),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return CustomBottomSheet(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BottomSheetTile(
                            title: Text('낮은가격순',
                                style: AppTheme.boldTitle3
                                    .apply(color: AppTheme.primaryPurple)),
                            trailing: Icon(
                              Icons.check,
                              color: AppTheme.primaryPurple,
                              size: 12,
                            ),
                          ),
                          Divider(
                            color: AppTheme.grey10,
                            height: 1,
                            thickness: 1,
                          ),
                          BottomSheetTile(
                            title: Text(
                              '높은가격순',
                              style: AppTheme.boldTitle3
                                  .apply(color: AppTheme.grey30),
                            ),
                            trailing: Icon(
                              Icons.check,
                              color: AppTheme.grey30,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('낮은 가격순'),
                      Icon(Icons.arrow_drop_down_rounded)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: GridView.count(
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: List.generate(mockProducts.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                                  product: mockProducts.firstWhere(
                                      (e) => e.id == mockProducts[index].id),
                                )));
                      },
                      child: _thumbNail(
                        mockProducts[index],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }

  _thumbNail(Product product) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.imgUrl,
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand,
                    style: AppTheme.body2,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    product.name,
                    style: AppTheme.title3,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${product.salePrice}',
                    style:
                        AppTheme.boldTitle3.apply(color: AppTheme.darkPurple),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
