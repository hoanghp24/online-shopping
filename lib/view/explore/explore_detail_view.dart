import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/product_cell.dart';

import '../../common/color_extension.dart';
import '../../model/explore_category_model.dart';
import '../../view_model/explore_item_view_model.dart';
import '../home/product_details_view.dart';

class ExploreDetailView extends StatefulWidget {
  final ExploreCategoryModel eObj;
  const ExploreDetailView({super.key, required this.eObj});

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {
  late ExploreItemViewMode listVM;

  @override
  void initState() {
    super.initState();
    listVM = Get.put(ExploreItemViewMode(widget.eObj));
  }

  @override
  void dispose() {
    Get.delete<ExploreItemViewMode>();
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
          title: Text(
            widget.eObj.catName ?? "",
            style: const TextStyle(
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
              childAspectRatio: 0.72,
              mainAxisSpacing: 20,
            ),
            itemCount: listVM.listArr.length,
            itemBuilder: ((context, index) {
              var pObj = listVM.listArr[index];
              return ProductCell(
                pObj: pObj,
                onPressed: () async {
                  await Get.to(() => ProductDetails(
                        pObj: pObj,
                      ));
                  listVM.serviceCallList();
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
