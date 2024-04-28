import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app/common/color_extension.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key,
    required this.rating,
    this.color = TColor.primary,
    this.itemSize = 20,
  });

  final double rating, itemSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      unratedColor: Colors.grey[300],
      itemBuilder: (context, index) => Icon(Icons.star_rounded, color: color),
    );
  }
}
