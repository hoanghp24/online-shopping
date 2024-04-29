import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/my_order_row.dart';
import 'package:shop_app/view/main_tabview/main_tabview.dart';
import 'package:shop_app/view_model/addres_view_model.dart';

import '../../common/color_extension.dart';
import '../../view_model/my_orders_view_model.dart';
import 'my_order_detail_view.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  final myVM = Get.put(MyOrdersViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<AddressViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Đơn hàng của tôi",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          Get.offAll(const MainTabView());
        },
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => myVM.listArr.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.box_search, size: 50, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      "Chưa có đơn hàng nào",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                itemBuilder: (context, index) {
                  var mObj = myVM.listArr[index];
                  return MyOrderRow(
                      mObj: mObj,
                      onTap: () {
                        Get.to(() => MyOrdersDetailView(mObj: mObj));
                      });
                },
                itemCount: myVM.listArr.length),
      ),
    );
  }
}
