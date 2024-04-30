import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/globs.dart';
import 'package:shop_app/common/service_call.dart';

import '../model/offer_product_model.dart';

class FavoriteViewModel extends GetxController {
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("FavoriteViewModel Init ");
    }

    serviceCalList();
  }

  //ServiceCall
  void serviceCalList() {
    // Globs.showHUD();
    ServiceCall.post({}, SVKey.svFavorite, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(
          backgroundColor: const Color(0xFF2196F3),
          colorText: Colors.white,
          Globs.appName,
          err.toString());
    });
  }

  void serviceCallAddRemoveFavorite(int index) {
    // Globs.showHUD();
    ServiceCall.post({
      "prod_id": listArr[index].prodId.toString(),
    }, SVKey.svAddRemoveFavorite, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        listArr.removeAt(index);
        Get.snackbar(
            backgroundColor: const Color(0xFF2196F3),
            colorText: Colors.white,
            Globs.appName,
            resObj[KKey.message]);
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(
          backgroundColor: const Color(0xFF2196F3),
          colorText: Colors.white,
          Globs.appName,
          err.toString());
    });
  }
}
