import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/formatter.dart';
import 'package:shop_app/common_widget/round_button.dart';
import 'package:shop_app/view/account/address_list_view.dart';
import 'package:shop_app/view/account/payment_method_view.dart';
import 'package:shop_app/view/account/promo_code_view.dart';
import 'package:shop_app/view_model/cart_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/checkout_row.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final cartVM = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Thanh toán",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close)),
                ],
              ),
            ),
            const Divider(
              color: Colors.black26,
              height: 1,
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     const Text(
            //       "Phương thức vận chuyển",
            //       style: TextStyle(
            //           color: TColor.secondaryText,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w600),
            //     ),
            //     const Spacer(),
            //     CupertinoSegmentedControl(
            //         children: const {
            //           "1": Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 8),
            //               child: Text("Vận chuy")),
            //           "2": Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 8),
            //               child: Text("Tại cửa hàng")),
            //         },
            //         selectedColor: TColor.primary,
            //         groupValue: cartVM.deliveryType.value,
            //         onValueChanged: (sObj) {
            //           cartVM.deliveryType.value = sObj;
            //         }),
            //     const Divider(
            //       color: Colors.black26,
            //       height: 1,
            //     ),
            //   ],
            // ),
            CheckoutRow(
              title: "Đ/c nhận hàng",
              value: (cartVM.deliverObj.value.name ?? "") != ""
                  ? (cartVM.deliverObj.value.name ?? "")
                  : "Chọn",
              onPressed: () {
                Get.to(() => AddressListView(
                      didSelect: (aObj) {
                        cartVM.deliverObj.value = aObj;
                      },
                    ));
              },
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 15),
            //       child: Row(
            //         children: [
            //           Text(
            //             "Phương thức thanh toán",
            //             style: TextStyle(
            //                 color: TColor.secondaryText,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w600),
            //           ),
            //           const Spacer(),
            //           CupertinoSegmentedControl(
            //               children: const {
            //                 "1": Padding(
            //                     padding: EdgeInsets.symmetric(horizontal: 8),
            //                     child: Text("COD")),
            //                 "2": Padding(
            //                     padding: EdgeInsets.symmetric(horizontal: 8),
            //                     child: Text("Online")),
            //               },
            //               selectedColor: TColor.primary,
            //               groupValue: cartVM.paymentType.value,
            //               onValueChanged: (sObj) {
            //                 cartVM.paymentType.value = sObj;
            //               }),
            //         ],
            //       ),
            //     ),
            //     const Divider(
            //       color: Colors.black26,
            //       height: 1,
            //     ),
            //   ],
            // ),
            // if (cartVM.paymentType.value == "2")
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => PaymentMethodListView(
                          didSelect: (pObj) {
                            cartVM.paymentObj.value = pObj;
                          },
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        const Text(
                          "Phương thức thanh toán",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/img/master.png",
                          width: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          (cartVM.paymentObj.value.name ?? "") != ""
                              ? (cartVM.paymentObj.value.cardNumber ?? "")
                              : "Chọn",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Iconsax.arrow_right_3)
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
              ],
            ),
            CheckoutRow(
              title: "Mã giảm giá",
              value: (cartVM.promoObj.value.code ?? "") != ""
                  ? (cartVM.promoObj.value.code ?? "")
                  : "Chọn",
              onPressed: () {
                Get.to(() => PromoCodeView(
                      didSelect: (pObj) {
                        cartVM.promoObj.value = pObj;
                        cartVM.serviceCallList();
                      },
                    ));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Tổng tiền hàng",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text(
                            Formatter.formatCurrency(
                                int.parse(cartVM.cartTotalPrice.value)),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        const Text(
                          "Phí vận chuyển",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text(
                            Formatter.formatCurrency(
                                int.parse(cartVM.deliverPriceAmount.value)),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Giảm giá",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text(
                            "- ${Formatter.formatCurrency(int.parse(cartVM.discountAmount.value))}",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CheckoutRow(
              title: "Tổng thanh toán",
              value: Formatter.formatCurrency(
                  int.parse(cartVM.userPayPrice.value)),
              onPressed: () {},
              showArrow: false,
            ),
            const SizedBox(height: 16),
            RoundButton(
                title: "Thanh toán",
                onPressed: () {
                  cartVM.serviceCallOrderPlace();
                }),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
