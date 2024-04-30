import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/product_cell.dart';
import 'package:shop_app/view/home/product_details_view.dart';
import 'package:shop_app/view_model/home_view_model.dart';

import '../../common/color_extension.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  final homeVM = Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();
    txtSearch.addListener(onSearchTextChanged);
  }

  void onSearchTextChanged() {
    homeVM.searchProducts(txtSearch.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: TAppBar(
          centerTitle: true,
          elevation: 0,
          showBackArrow: true,
          title: Container(
            height: 52,
            decoration: BoxDecoration(
                color: const Color(0xffF2F3F2),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: TextField(
              controller: txtSearch,
              onChanged: (value) {
                homeVM.searchProducts(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(Iconsax.search_normal_1),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    txtSearch.text = "";
                    homeVM.searchProducts('');
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {});
                  },
                  icon: const Icon(Iconsax.close_circle5, color: Colors.grey),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Tìm kiếm",
                hintStyle: const TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          onPressed: () => Get.back(),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 20,
          ),
          itemCount: homeVM.searchListArr.length,
          itemBuilder: ((context, index) {
            if (index < homeVM.searchListArr.length) {
              var pObj = homeVM.searchListArr[index];
              return ProductCell(
                pObj: pObj,
                onPressed: () async {
                  await Get.to(() => ProductDetails(pObj: pObj));
                  homeVM.serviceCallHome();
                },
                onCart: () {
                  // CartViewModel.serviceCallAddToCart(
                  //     pObj.prodId ?? 0, 1, () {});
                },
              );
            } else {
              return const SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
