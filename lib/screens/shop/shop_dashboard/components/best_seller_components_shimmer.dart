import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/screens/home/components/featured_product_item_component_shimmer.dart';

class BestSellerComponentsShimmer extends StatelessWidget {
  const BestSellerComponentsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        SizedBox(
          width: Get.width,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 48, vertical: 8)),
              ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 36, vertical: 8)),
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
        24.height,
        AnimatedWrap(
          runSpacing: 16,
          spacing: 16,
          columnCount: 2,
          itemCount: 6,
          itemBuilder: (p0, p1) {
            return const FeaturedProductItemComponentShimmer(isFromWishList: false);
          },
        ).paddingSymmetric(horizontal: 16)
      ],
    ).paddingSymmetric(vertical: 16);
  }
}
