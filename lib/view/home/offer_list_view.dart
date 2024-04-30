import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/product_cell.dart';
import 'package:shop_app/model/product_detail_model.dart';
import 'package:shop_app/view_model/explore_view_model.dart';
import 'package:shop_app/view_model/home_view_model.dart';

import '../../common/color_extension.dart';
import '../../model/explore_category_model.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/explore_item_view_model.dart';
import '../home/product_details_view.dart';

class OfferListView extends StatefulWidget {
  const OfferListView({super.key});

  @override
  State<OfferListView> createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  final homeVM = Get.put(HomeViewModel());
  final exploreVM = Get.put(ExploreViewModel());

  @override
  void dispose() {
    Get.delete<HomeViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: TAppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          showBackArrow: true,
          title: const Text(
            "Ưu đãi hấp dẫn",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        body: Obx(
          () => GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
            ),
            itemCount: homeVM.offerArr.length,
            itemBuilder: ((context, index) {
              var pObj = homeVM.offerArr[index];
              return ProductCell(
                pObj: pObj,
                onPressed: () async {
                  await Get.to(() => ProductDetails(
                        pObj: pObj,
                      ));
                  homeVM.serviceCallHome();
                },
                onCart: () {
                  // CartViewModel.serviceCallAddToCart(
                  //     pObj.prodId ?? 0, 1, () {});
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
