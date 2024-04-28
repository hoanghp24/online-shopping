import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/formatter.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/my_order_row.dart';
import 'package:shop_app/view_model/addres_view_model.dart';

import '../../common/color_extension.dart';
import '../../common_widget/order_item_row.dart';
import '../../model/my_order_model.dart';
import '../../view_model/my_order_detail_view_model.dart';

class MyOrdersDetailView extends StatefulWidget {
  final MyOrderModel mObj;
  const MyOrdersDetailView({super.key, required this.mObj});

  @override
  State<MyOrdersDetailView> createState() => _MyOrdersDetailViewState();
}

class _MyOrdersDetailViewState extends State<MyOrdersDetailView> {
  late MyOrderDetailViewModel detailVM;

  @override
  void initState() {
    super.initState();
    detailVM = Get.put(MyOrderDetailViewModel(widget.mObj));
  }

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
        centerTitle: true,
        title: const Text(
          "Chi tiết đơn hàng",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Mã vận đơn: ${widget.mObj.orderId}",
                            style: const TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          getOrderStatus(widget.mObj),
                          style: TextStyle(
                              color: getOrderStatusColor(widget.mObj),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            Formatter.formatDateTime(
                                DateTime.parse(widget.mObj.createdDate!)),
                            style: const TextStyle(
                                color: TColor.secondaryText, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${widget.mObj.address ?? ""}, ${widget.mObj.state ?? ""}, ${widget.mObj.city ?? ""}, ${widget.mObj.postalCode} ",
                      style: const TextStyle(
                          color: TColor.secondaryText, fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                  ]),
            ),
            Obx(
              () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  itemBuilder: (context, index) {
                    var pObj = detailVM.cartList[index];
                    return OrderItemRow(
                      pObj: pObj,
                    );
                  },
                  itemCount: detailVM.cartList.length),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Tổng tiền hàng:",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            Formatter.formatCurrency(
                                widget.mObj.totalPrice ?? 0),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: TColor.primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Phí vận chuyển:",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            Formatter.formatCurrency(
                                widget.mObj.deliverPrice ?? 0),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: TColor.primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Giảm giá:",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            "- ${Formatter.formatCurrency(widget.mObj.discountPrice ?? 0)}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black12),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          "Tổng thanh toán:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            Formatter.formatCurrency(
                                widget.mObj.userPayPrice ?? 0),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: TColor.primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
