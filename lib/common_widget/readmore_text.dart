import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_app/common/color_extension.dart';

class TReadMoreText extends StatelessWidget {
  const TReadMoreText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 4,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Xem thêm',
      trimExpandedText: 'Thu gọn',
      moreStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: TColor.primary,
          decorationColor: TColor.primary),
      lessStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: TColor.primary,
          decorationColor: TColor.primary),
    );
  }
}
