import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'package:slide_countdown/slide_countdown.dart';

class SectionView extends StatelessWidget {
  final String title;
  final bool isShowSeeAllButton, isSale;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  const SectionView(
      {super.key,
      required this.title,
      this.isShowSeeAllButton = true,
      this.padding,
      required this.onPressed,
      this.isSale = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: TColor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              if (isSale)
                SlideCountdownSeparated(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    duration: const Duration(hours: 12),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10))),
            ],
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              "Xem thêm",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
