import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/product_cell.dart';
import 'package:shop_app/view/home/product_details_view.dart';
import 'package:shop_app/view_model/cart_view_model.dart';

import '../../common/color_extension.dart';
import '../../view_model/favourite_view_model.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final favVM = Get.find<FavoriteViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          "Mục yêu thích",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          favVM.listArr.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.box_search, size: 50, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        "Chưa có sản phẩm yêu thích nào",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: favVM.listArr.length,
                  itemBuilder: ((context, index) {
                    var pObj = favVM.listArr[index];
                    return ProductCell(
                      pObj: pObj,
                      onPressed: () async {
                        await Get.to(() => ProductDetails(pObj: pObj));

                        favVM.serviceCalList();
                      },
                      onCart: () {
                        CartViewModel.serviceCallAddToCart(
                            pObj.prodId ?? 0, 1, () {});
                      },
                    );
                  }),
                ),
        ],
      ),
    );
  }
}
