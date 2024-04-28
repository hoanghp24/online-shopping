import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/formatter.dart';
import 'package:shop_app/model/my_order_model.dart';

import '../common/color_extension.dart';

class MyOrderRow extends StatelessWidget {
  final MyOrderModel mObj;
  final VoidCallback onTap;
  const MyOrderRow({super.key, required this.mObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                    "Mã vận đơn: ",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                      child: Text(
                    mObj.orderId?.toString() ?? "",
                    style: const TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
                  Text(
                    getOrderStatus(mObj),
                    style: TextStyle(
                        color: getOrderStatusColor(mObj),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                Formatter.formatDateTime(
                    DateTime.parse(mObj.createdDate ?? "")),
                style:
                    const TextStyle(color: TColor.secondaryText, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((mObj.images?.length ?? 0) > 0)
                    CachedNetworkImage(
                      imageUrl: mObj.images?[0] ?? "",
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  mObj.names ?? "",
                                  style: const TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                Formatter.formatCurrency(mObj.userPayPrice!),
                                style: const TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

String getOrderStatus(MyOrderModel mObj) {
  //1: new, 2: order_accept, 3: order_delivered, 4: cancel, 5: order declined
  switch (mObj.orderStatus) {
    case 1:
      return "Chờ xác nhận";
    case 2:
      return "Chờ giao hàng";
    case 3:
      return "Đã giao";
    case 4:
      return "Đã huỷ";
    case 5:
      return "Trả hàng";
    default:
      return "";
  }
}

String getDeliverType(MyOrderModel mObj) {
  switch (mObj.deliverType) {
    case 1:
      return "Delivery";
    case 2:
      return "Collection";
    default:
      return "";
  }
}

String getPaymentType(MyOrderModel mObj) {
  switch (mObj.paymentType) {
    case 1:
      return "Cash On Delivery";
    case 2:
      return "Online Card Payment";
    default:
      return "";
  }
}

String getPaymentStatus(MyOrderModel mObj) {
  //1: waiting, 2: done, 3: fail, 4: refund

  if (mObj.paymentType == 1) {
    return "COD";
  }
  switch (mObj.paymentStatus) {
    case 1:
      return "Processing";
    case 2:
      return "Success";
    case 3:
      return "Fail";
    case 4:
      return "Refunded";
    default:
      return "";
  }
}

Color getPaymentStatusColor(MyOrderModel mObj) {
  //1: waiting, 2: done, 3: fail, 4: refund

  if (mObj.paymentType == 1) {
    return Colors.orange;
  }
  switch (mObj.paymentStatus) {
    case 1:
      return Colors.blue;
    case 2:
      return Colors.green;
    case 3:
      return Colors.red;
    case 4:
      return Colors.green;
    default:
      return Colors.white;
  }
}

Color getOrderStatusColor(MyOrderModel mObj) {
  //1: new, 2: order_accept, 3: order_delivered, 4: cancel, 5: order declined
  switch (mObj.orderStatus) {
    case 1:
      return Colors.blue;
    case 2:
      return Colors.green;
    case 3:
      return Colors.green;
    case 4:
      return Colors.red;
    case 5:
      return Colors.red;
    default:
      return TColor.primary;
  }
}
