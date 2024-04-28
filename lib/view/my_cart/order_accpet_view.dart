import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/my_order_row.dart';
import 'package:shop_app/common_widget/round_button.dart';
import 'package:shop_app/view/account/my_order_detail_view.dart';
import 'package:shop_app/view/account/my_order_view.dart';

import '../../common/color_extension.dart';

class OrderAcceptView extends StatefulWidget {
  const OrderAcceptView({super.key});

  @override
  State<OrderAcceptView> createState() => _OrderAcceptViewState();
}

class _OrderAcceptViewState extends State<OrderAcceptView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/img/bottom_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    "assets/img/order_accpeted.png",
                    width: media.width * 0.7,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Đặt hàng thành công",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Đơn hàng của bạn sẽ được xác nhận và giao hàng trong thời gian sớm nhất",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Tiếp tục mua sắm",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
