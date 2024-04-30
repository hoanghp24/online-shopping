import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/view/my_cart/checkout_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/cart_item_row.dart';
import '../../view_model/cart_view_model.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  final cartVM = Get.put(CartViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<CartViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: const Text(
          "Giỏ hàng",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() => ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: cartVM.listArr.length,
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
              itemBuilder: (context, index) {
                var cObj = cartVM.listArr[index];
                return CartItemRow(
                  cObj: cObj,
                  didQtyAdd: () {
                    cartVM.serviceCallUpdateCart(cObj, (cObj.qty ?? 0) + 1);
                  },
                  didQtySub: () {
                    var qty = cObj.qty ?? 0;
                    qty -= 1;

                    if (qty < 0) {
                      qty = 0;
                    }
                    cartVM.serviceCallUpdateCart(cObj, qty);
                  },
                  didDelete: () {
                    cartVM.serviceCallRemoveCart(cObj);
                  },
                );
              })),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: cartVM.listArr.isNotEmpty
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                children: [
                  cartVM.listArr.isNotEmpty
                      ? MaterialButton(
                          onPressed: () {
                            showCheckout();
                          },
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          minWidth: double.maxFinite,
                          elevation: 0.1,
                          color: TColor.primary,
                          child: const Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Mua hàng",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const Column(
                          children: [
                            Icon(Iconsax.box_search,
                                size: 50, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                              "Chưa có gì trong giỏ",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Tiếp tục xem để mua sắm!",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showCheckout() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const CheckoutView();
        });
  }
}
