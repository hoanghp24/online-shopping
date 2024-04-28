import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/home_categories.dart';
import 'package:shop_app/common_widget/promo_slider.dart';
import 'package:shop_app/model/offer_product_model.dart';
import 'package:shop_app/view/explore/explore_detail_view.dart';
import 'package:shop_app/view/explore/explore_view.dart';
import 'package:shop_app/view/explore/search_view.dart';
import 'package:shop_app/view/home/product_details_view.dart';
import 'package:shop_app/view_model/explore_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/category_cell.dart';
import '../../common_widget/product_cell.dart';
import '../../common_widget/section_view.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  final homeVM = Get.put(HomeViewModel());
  final exploreVM = Get.put(ExploreViewModel());

  @override
  void dispose() {
    Get.delete<HomeViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/app_logo.png",
                    width: 100,
                    color: TColor.primary,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Get.to(() => const SearchView()),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F3F2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Icon(Iconsax.search_normal_1),
                          const SizedBox(width: 8),
                          Expanded(
                              child: Text('Tìm kiếm tại cửa hàng',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: PromoSlider(sliders: [
                    "assets/img/slider2.png",
                    "assets/img/slider3.png",
                    "assets/img/slider4.png",
                  ])),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: 90,
                  child: Obx(
                    () => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: exploreVM.listArr.length,
                        itemBuilder: (context, index) {
                          var pObj = exploreVM.listArr[index];

                          return HomeCategories(
                            pObj: pObj,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExploreDetailView(
                                          eObj: pObj,
                                        )),
                              );
                            },
                          );
                        }),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SectionView(
                title: "Sản phẩm bán chạy",
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onPressed: () {},
              ),
              SizedBox(
                height: 280,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: homeVM.bestSellingArr.length,
                      itemBuilder: (context, index) {
                        var pObj = homeVM.bestSellingArr[index];

                        return ProductCell(
                          pObj: pObj,
                          onPressed: () async {
                            await Get.to(() => ProductDetails(pObj: pObj));

                            homeVM.serviceCallHome();
                          },
                          onCart: () {
                            CartViewModel.serviceCallAddToCart(
                                pObj.prodId ?? 0, 1, () {});
                          },
                        );
                      }),
                ),
              ),
              SectionView(
                title: "Ưu đãi hấp dẫn",
                isSale: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onPressed: () {},
              ),
              SizedBox(
                height: 280,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: homeVM.listArr.length,
                      itemBuilder: (context, index) {
                        var pObj = homeVM.listArr[index];

                        return ProductCell(
                          pObj: pObj,
                          onPressed: () async {
                            await Get.to(() => ProductDetails(
                                  pObj: pObj,
                                ));

                            homeVM.serviceCallHome();
                          },
                          onCart: () {
                            CartViewModel.serviceCallAddToCart(
                                pObj.prodId ?? 0, 1, () {});
                          },
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
