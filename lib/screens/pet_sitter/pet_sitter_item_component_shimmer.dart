import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/circle_widget.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';

class PetSitterItemComponentShimmer extends StatelessWidget {
  final double width;
  final double height;

  const PetSitterItemComponentShimmer({super.key, this.width = 130, this.height = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.42,
      alignment: Alignment.center,
      decoration: boxDecorationDefault(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerWidget(
                baseColor: shimmerLightBaseColor,
                child: const CircleWidget(height: 88, width: 88),
              ),
              16.height,
              ShimmerWidget(
                baseColor: shimmerLightBaseColor,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  decoration: boxDecorationDefault(),
                ),
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerWidget(
                    baseColor: shimmerLightBaseColor,
                    child: const CircleWidget(height: 36, width: 36),
                  ),
                  16.width,
                  ShimmerWidget(
                    baseColor: shimmerLightBaseColor,
                    child: const CircleWidget(height: 36, width: 36),
                  )
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 8, vertical: 14),
          ShimmerWidget(
            baseColor: shimmerLightBaseColor,
            child: Container(
              width: Get.width * 0.42,
              height: Get.width * 0.42 + 35,
              decoration: boxDecorationDefault(),
            ),
          )
        ],
      ),
    );
  }
}
