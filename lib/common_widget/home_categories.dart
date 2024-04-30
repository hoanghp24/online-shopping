import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/color_extension.dart';
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
              CachedNetworkImage(
                imageUrl: pObj.image ?? "",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: TColor.primary,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
