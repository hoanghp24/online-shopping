import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/color_extension.dart';
import 'package:shop_app/common/formatter.dart';
import 'package:shop_app/common/pricing_calculator.dart';
import 'package:shop_app/common_widget/sale_tag.dart';

import '../model/offer_product_model.dart';

class ProductCell extends StatelessWidget {
  final OfferProductModel pObj;
  final VoidCallback onPressed;
  final VoidCallback onCart;
  final double margin;
  final double weight;

  const ProductCell(
      {super.key,
      required this.pObj,
      required this.onPressed,
      this.weight = 180,
      this.margin = 8,
      required this.onCart});

  @override
  Widget build(BuildContext context) {
    int discountedPrice = PricingCalculator.calculateDiscountedPrice(
        pObj.price!, pObj.unitValue!);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: weight,
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: TColor.placeholder.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: pObj.image ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: TColor.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 12,
                    left: 5,
                    child: SaleTag(salePercent: pObj.unitValue!)),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pObj.name ?? "",
                    maxLines: 1,
                    style: const TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${pObj.detail}",
                    style: const TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        Formatter.formatCurrency(discountedPrice),
                        style: const TextStyle(
                            color: TColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        Formatter.formatCurrency(pObj.price!),
                        style: const TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
