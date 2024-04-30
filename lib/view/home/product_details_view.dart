import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app/common/formatter.dart';
import 'package:shop_app/common/globs.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/sale_tag.dart';
import 'package:shop_app/view/product_reviews/product_reviews.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../model/offer_product_model.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_detail_view_model.dart';

class ProductDetails extends StatefulWidget {
  final OfferProductModel pObj;
  const ProductDetails({super.key, required this.pObj});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductDetailViewMode detailVM;

  String selectedSize = "";
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  void initState() {
    super.initState();
    detailVM = Get.put(ProductDetailViewMode(widget.pObj));
  }

  @override
  void dispose() {
    Get.delete<ProductDetailViewMode>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.maxFinite,
                  height: media.width * 0.8,
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: detailVM.pObj.image ?? "",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: double.infinity,
                  ),
                ),
                TAppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  showBackArrow: true,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          detailVM.pObj.name ?? "",
                          style: const TextStyle(
                              color: TColor.primaryText,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            detailVM.serviceCallAddRemoveFavorite();
                          },
                          icon: !detailVM.isFav.value
                              ? const Icon(
                                  Iconsax.heart,
                                )
                              : const Icon(Iconsax.heart5, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "${detailVM.pObj.catName!}, ${detailVM.pObj.detail}",
                        style: const TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 16),
                      SaleTag(salePercent: detailVM.pObj.unitValue!)
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          detailVM.addSubQTY(isAdd: false);
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(Icons.remove, color: Colors.grey)),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: TColor.placeholder.withOpacity(0.5),
                              width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Obx(() => Text(
                              detailVM.qty.value.toString(),
                              style: const TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          detailVM.addSubQTY(isAdd: true);
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(Icons.add, color: TColor.primary)),
                      ),
                      const Spacer(),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              detailVM.getPrice(),
                              style: const TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              Formatter.formatCurrency(detailVM.pObj.price!),
                              style: const TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 18,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Kích cỡ: ",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Wrap(
                        children: sizes.map((size) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              decoration: BoxDecoration(
                                color: selectedSize == size
                                    ? TColor.primary
                                    : Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: selectedSize == size
                                      ? Colors.white
                                      : TColor.primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Image.asset("assets/img/size.png"))),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Iconsax.ruler),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Kiểm tra size của bạn",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Mô tả ngắn gọn",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Obx(() => IconButton(
                          onPressed: () {
                            detailVM.showDetail();
                          },
                          icon: Icon(!detailVM.isShowDetail.value
                              ? Iconsax.arrow_right_3
                              : Iconsax.arrow_down_1))),
                    ],
                  ),
                  Obx(() => detailVM.isShowDetail.value
                      ? Text(
                          detailVM.pObj.detail ?? "",
                          style: const TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      : Container()),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Kiểu dáng",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            detailVM.showNutrition();
                          },
                          icon: Icon(!detailVM.isShowNutrition.value
                              ? Iconsax.arrow_right_3
                              : Iconsax.arrow_down_1),
                        ),
                      )
                    ],
                  ),
                  Obx(() => detailVM.isShowNutrition.value
                      ? Text(
                          detailVM.pObj.nutritionWeight ?? "",
                          style: const TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      : Container()),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Đánh giá",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviewScreen());
                          },
                          icon: const Icon(Iconsax.arrow_right_3)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 55),
        child: RoundButton(
          title: "Thêm vào giỏ",
          onPressed: () {
            if (selectedSize.isEmpty) {
              Get.snackbar(
                  backgroundColor: const Color(0xFF2196F3),
                  colorText: Colors.white,
                  Globs.appName,
                  'Vui lòng chọn kích thước phù hợp');
              return;
            }

            CartViewModel.serviceCallAddToCart(
              widget.pObj.prodId ?? 0,
              detailVM.qty.value,
              selectedSize, // Chuyển selectedSize vào đây
              () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
