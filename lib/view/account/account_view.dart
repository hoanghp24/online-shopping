import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/view/account/payment_method_view.dart';
import 'package:shop_app/view/account/promo_code_view.dart';
import 'package:shop_app/view_model/my_detail_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/account_row.dart';
import '../../view_model/splash_view_model.dart';
import 'address_list_view.dart';
import 'my_detail_view.dart';
import 'my_order_view.dart';
import 'notification_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final splashVM = Get.find<SplashViewModel>();
  final detailVM = Get.put(MyDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/img/u1.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        splashVM.userPayload.value.name ?? "Anonymous",
                        style: const TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${splashVM.userPayload.value.email}",
                        style: const TextStyle(
                            color: TColor.secondaryText, fontSize: 16),
                      )
                    ],
                  ))
                ],
              ),
            ),
            const Divider(
              color: Colors.black26,
              height: 1,
            ),
            AccountRow(
              title: "Đơn hàng của tôi",
              icon: "assets/img/a_order.png",
              onPressed: () {
                Get.to(() => const MyOrdersView());
              },
            ),
            AccountRow(
              title: "Thông tin cá nhân",
              icon: "assets/img/a_my_detail.png",
              onPressed: () {
                Get.to(() => const MyDetailView());
              },
            ),
            AccountRow(
              title: "Sổ địa chị",
              icon: "assets/img/a_delivery_address.png",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressListView()));
              },
            ),
            AccountRow(
              title: "Thẻ thanh toán",
              icon: "assets/img/paymenth_methods.png",
              onPressed: () {
                Get.to(() => const PaymentMethodListView());
              },
            ),
            AccountRow(
              title: "Mã giảm giá",
              icon: "assets/img/a_promocode.png",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PromoCodeView()));
              },
            ),
            AccountRow(
              title: "Thông báo",
              icon: "assets/img/a_noitification.png",
              onPressed: () {
                Get.to(() => const NotificationListView());
              },
            ),
            AccountRow(
              title: "Trợ giúp",
              icon: "assets/img/a_help.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "Giới thiệu",
              icon: "assets/img/a_about.png",
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      splashVM.logout();
                    },
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    minWidth: double.maxFinite,
                    elevation: 0.1,
                    color: const Color(0xffF2F3F2),
                    child: const Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          "Đăng xuất",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
