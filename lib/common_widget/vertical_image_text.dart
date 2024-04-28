import 'package:flutter/material.dart';
import 'package:shop_app/common_widget/rounded_image.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.black,
    this.backgroundColor,
    this.onTap,
    this.radius = 100,
    this.height = 60,
    this.width = 60,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final double radius, height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(

            ///Circular icon
            children: [
              RoundedImage(
                isNetworkImage: true,
                radius: radius,
                height: height,
                width: width,
                backgroundColor: Colors.white,
                imageUrl: image,
                fit: BoxFit.fill,
              ),

              ///Text
              const SizedBox(height: 4),
              SizedBox(
                width: 55,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              )
            ]),
      ),
    );
  }
}
