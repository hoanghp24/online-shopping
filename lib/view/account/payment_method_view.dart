import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/payment_method_row.dart';
import 'package:shop_app/view/account/add_payment_method_view.dart';

import '../../common/color_extension.dart';
import '../../model/payment_model.dart';
import '../../view_model/payment_view_model.dart';

class PaymentMethodListView extends StatefulWidget {
  final Function(PaymentModel pObj)? didSelect;
  const PaymentMethodListView({super.key, this.didSelect});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final payVM = Get.put(PaymentViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<PaymentViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        backgroundColor: Colors.white,
        showBackArrow: true,
        centerTitle: true,
        title: const Text(
          "Phương thức thanh toán",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                payVM.clearAll();

                await Get.to(() => const AddPaymentMethodView());
                payVM.serviceCallList();
              },
              icon: const Icon(
                Iconsax.add,
                color: Colors.black,
                size: 30,
              )),
        ],
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var pObj = payVM.listArr[index];
              return PaymentMethodRow(
                pObj: pObj,
                onTap: () {
                  if (widget.didSelect != null) {
                    widget.didSelect!(pObj);
                    Get.back();
                  }
                },
                didUpdateDone: () {
                  payVM.serviceCallList();
                },
              );
            },
            itemCount: payVM.listArr.length),
      ),
    );
  }
}
