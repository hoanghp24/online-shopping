import 'package:flutter/material.dart';
import 'package:shop_app/common_widget/rounded_image.dart';
import 'package:shop_app/model/explore_category_model.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    this.textColor = Colors.black,
    this.backgroundColor,
    this.onTap,
    this.radius = 100,
    this.height = 70,
    this.width = 70,
    required this.pObj,
  });

  final ExploreCategoryModel pObj;

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
                imageUrl: pObj.image!,
                fit: BoxFit.cover,
              ),

              ///Text
              const SizedBox(height: 4),
              SizedBox(
                width: 55,
                child: Text(pObj.catName!,
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
