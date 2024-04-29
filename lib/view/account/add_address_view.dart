import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/line_textfield.dart';
import 'package:shop_app/common_widget/round_button.dart';
import 'package:shop_app/view_model/addres_view_model.dart';

import '../../common/color_extension.dart';
import '../../model/address_model.dart';

class AddAddressView extends StatefulWidget {
  final AddressModel? aObj;
  final bool isEdit;
  const AddAddressView({super.key, this.aObj, this.isEdit = false});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )),
        centerTitle: true,
        title: Text(
          widget.isEdit ? "Chỉnh sửa địa chỉ" : "Thêm địa chỉ",
          style: const TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              addressVM.txtType.value = "Nhà";
                            },
                            child: Row(
                              children: [
                                Icon(
                                  addressVM.txtType.value == "Nhà"
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: TColor.primaryText,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "Nhà",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            addressVM.txtType.value = "Văn phòng";
                          },
                          child: Row(
                            children: [
                              Icon(
                                addressVM.txtType.value == "Văn phòng"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: TColor.primaryText,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Văn phòng",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Tên",
                      placeholder: "Nhập tên của bạn",
                      controller: addressVM.txtName.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Số điện thoại",
                      placeholder: "Nhập số điện thoại",
                      keyboardType: TextInputType.phone,
                      controller: addressVM.txtMobile.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Địa chỉ cụ thể",
                      placeholder: "Nhập địa chỉ",
                      controller: addressVM.txtAddressLine.value),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LineTextField(
                            title: "Tỉnh/Thành phố",
                            placeholder: "Nhập tỉnh/thành phố",
                            controller: addressVM.txtCity.value),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: LineTextField(
                            title: "Quận/Huyện",
                            placeholder: "Nhập quận/huyện",
                            controller: addressVM.txtState.value),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Mã bưu điện",
                      placeholder: "Nhập mã bư điện",
                      controller: addressVM.txtPostalCode.value),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: widget.isEdit ? "Cập nhật" : "Thêm",
                  onPressed: () {
                    if (widget.isEdit) {
                      addressVM.serviceCallUpdate(widget.aObj?.addressId ?? 0,
                          () {
                        Navigator.pop(context);
                      });
                    } else {
                      addressVM.serviceCallAdd(() {
                        Navigator.pop(context);
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
