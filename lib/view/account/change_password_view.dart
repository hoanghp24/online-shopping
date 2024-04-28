import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/line_textfield.dart';
import 'package:shop_app/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../view_model/my_detail_view_model.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final detailVM = Get.put(MyDetailViewModel());

  @override
  void initState() {
    super.initState();
    detailVM.clearPassword();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<MyDetailViewModel>();
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
          "Đổi mật khẩu",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  LineTextField(
                      title: "Mật khẩu hiện tại",
                      placeholder: "Nhập mật khẩu hiện tại",
                      obscureText: true,
                      controller: detailVM.txtCurrentPassword.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Mật khẩu mới",
                      placeholder: "Nhập mật khẩu mới",
                      obscureText: true,
                      controller: detailVM.txtNewPassword.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Nhập lại mật khẩu",
                      obscureText: true,
                      placeholder: "Nhập lại mật khẩu",
                      controller: detailVM.txtConfirmPassword.value),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Xác nhận",
                  onPressed: () {
                    detailVM.serviceCallSetPassword(() {
                      Navigator.pop(context);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
