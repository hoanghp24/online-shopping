import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';
import '../../view_model/forgot_password_view_model.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final forgotVM = Get.put(ForgotPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset("assets/img/bottom_bg.png",
            width: media.width, height: media.height, fit: BoxFit.cover),
      ),
      Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          elevation: 0,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/app_logo.png",
                          width: 100, color: TColor.primary),
                    ],
                  ),
                  SizedBox(height: media.width * 0.15),
                  const Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: media.width * 0.03),
                  const Text(
                    "Nhập email của bạn để đặt lại mật khẩu",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: media.width * 0.1),
                  LineTextField(
                    title: "Email",
                    placeholder: "Nhập địa chỉ email",
                    controller: forgotVM.txtEmail.value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: media.width * 0.05),
                  RoundButton(
                    title: "Xác nhận",
                    onPressed: () {
                      forgotVM.serviceCallRequest();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const MainTabView()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
