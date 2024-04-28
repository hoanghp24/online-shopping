import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/model/address_model.dart';
import 'package:shop_app/view_model/addres_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/address_row.dart';
import 'add_address_view.dart';

class AddressListView extends StatefulWidget {
  final Function(AddressModel aObj)? didSelect;
  const AddressListView({super.key, this.didSelect});

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  final addressVM = Get.put(AddressViewModel());

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
          backgroundColor: Colors.white,
          showBackArrow: true,
          onPressed: () {
            Get.back();
          },
          centerTitle: true,
          title: const Text(
            "Địa chỉ nhận hàng",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  addressVM.clearAll();

                  await Get.to(() => const AddAddressView());
                  addressVM.serviceCallList();
                },
                icon: const Icon(
                  Iconsax.add,
                  color: Colors.black,
                  size: 30,
                ))
          ]),
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var aObj = addressVM.listArr[index];
              return AddressRow(
                aObj: aObj,
                onTap: () {
                  if (widget.didSelect != null) {
                    widget.didSelect!(aObj);
                    Get.back();
                  }
                },
                didUpdateDone: () {
                  addressVM.serviceCallList();
                },
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.black12, height: 1),
            itemCount: addressVM.listArr.length),
      ),
    );
  }
}
