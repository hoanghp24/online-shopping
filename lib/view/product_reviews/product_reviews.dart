import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/color_extension.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/view/product_reviews/widgets/overall_product_rating.dart';
import 'package:shop_app/view/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:shop_app/view/product_reviews/widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        centerTitle: true,
        title: const Text(
          "Đánh giá sản phẩm",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        showBackArrow: true,
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Overall
              const OverallProductRating(),
              const TRatingBarIndicator(rating: 4.2),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),

              Divider(color: Colors.grey.shade200),
              const SizedBox(height: 24),

              /// User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
