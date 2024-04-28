import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common/color_extension.dart';
import 'package:shop_app/common_widget/circular_container.dart';
import 'package:shop_app/common_widget/rounded_image.dart';
import 'package:shop_app/view_model/home_view_model.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.sliders,
  });

  final List<String> sliders;

  @override
  Widget build(BuildContext context) {
    final homeVM = Get.put(HomeViewModel());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              viewportFraction: 1,
              onPageChanged: (index, _) => homeVM.updatePageIndicator(index),
            ),
            items: sliders
                .map((url) => RoundedImage(
                      imageUrl: url,
                      fit: BoxFit.fill,
                      radius: 16,
                    ))
                .toList()),
        const SizedBox(height: 16),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < sliders.length; i++)
                CircularContainer(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 10, bottom: 15),
                  backgroundColor: homeVM.carouselCurrentIndex.value == i
                      ? TColor.primary
                      : Colors.grey.shade200,
                )
            ],
          ),
        )
      ],
    );
  }
}
