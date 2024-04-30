import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/globs.dart';
import 'package:shop_app/common/service_call.dart';

import '../model/offer_product_model.dart';
import '../model/type_model.dart';

class HomeViewModel extends GetxController {
  final RxList<OfferProductModel> offerArr = <OfferProductModel>[].obs;
  final RxList<OfferProductModel> bestSellingArr = <OfferProductModel>[].obs;
  final RxList<TypeModel> groceriesArr = <TypeModel>[].obs;
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;
  final RxList<OfferProductModel> searchListArr = <OfferProductModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("HomeViewModel Init ");
    }

    serviceCallHome();
  }

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  void searchProducts(String searchText) {
    searchListArr.clear();
    if (searchText.isEmpty) {
      searchListArr.addAll(listArr);
    } else {
      searchListArr.addAll(listArr.where((pObj) =>
          pObj.name!.toLowerCase().contains(searchText.toLowerCase())));
    }
  }

  //ServiceCall
  void serviceCallHome() {
    // Globs.showHUD();
    ServiceCall.post({}, SVKey.svHome, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var payload = resObj[KKey.payload] as Map? ?? {};

        var offerDataArr = (payload["list"] as List? ?? [])
            .map((oObj) {
              return OfferProductModel.fromJson(oObj);
            })
            .where((pObj) => pObj.unitValue != null && pObj.unitValue! > 0)
            .toList();

        offerArr.value = offerDataArr;

        var bestSellingDataArr = (payload["list"] as List? ?? [])
            .map((oObj) {
              return OfferProductModel.fromJson(oObj);
            })
            .where((pObj) => pObj.unitName == 1)
            .toList();

        bestSellingArr.value = bestSellingDataArr;

        var typeDataArr = (payload["type_list"] as List? ?? []).map((oObj) {
          return TypeModel.fromJson(oObj);
        }).toList();

        groceriesArr.value = typeDataArr;

        var listDataArr = (payload["list"] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;

        searchProducts('');
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(
          backgroundColor: Color(0xFF2196F3),
          colorText: Colors.white,
          Globs.appName,
          err.toString());
    });
  }
}
