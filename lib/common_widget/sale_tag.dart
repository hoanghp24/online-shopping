import 'package:flutter/material.dart';
import 'package:shop_app/common_widget/rounded_container.dart';

class SaleTag extends StatelessWidget {
  const SaleTag({super.key, required this.salePercent, this.opacity = 0.1});

  final int salePercent;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      radius: 5,
      backgroundColor: const Color(0xFFD73831),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Text('- $salePercent%',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}
