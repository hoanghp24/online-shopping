import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/view/login/sign_up_view.dart';
import 'package:shop_app/view_model/login_view_model.dart';
import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';
import 'forgot_password_view.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final loginVM = Get.put(LoginViewModel());

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
        appBar: TAppBar(onPressed: () {}),
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
                    "Đăng nhập",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: media.width * 0.03),
                  const Text(
                    "Nhập email và mật khẩu của bạn",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: media.width * 0.1),
                  LineTextField(
                    title: "Email",
                    placeholder: "Nhập địa chỉ email",
                    controller: loginVM.txtEmail.value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: media.width * 0.07),
                  Obx(
                    () => LineTextField(
                      title: "Mật khẩu",
                      placeholder: "Nhập mật khẩu",
                      controller: loginVM.txtPassword.value,
                      obscureText: !loginVM.isShowPassword.value,
                      right: IconButton(
                          onPressed: () {
                            loginVM.showPassword();
                          },
                          icon: Icon(
                            !loginVM.isShowPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: TColor.textTittle,
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPasswordView());
                        },
                        child: const Text(
                          "Quên mật khẩu?",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: media.width * 0.05),
                  RoundButton(
                    title: "Đăng nhập",
                    onPressed: () {
                      loginVM.serviceCallLogin();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const MainTabView()));
                    },
                  ),
                  SizedBox(height: media.width * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpView()));
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Bạn chưa có tài khoản?",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Đăng ký",
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ))
                    ],
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
