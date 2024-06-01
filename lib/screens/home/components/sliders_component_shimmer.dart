import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/circle_widget.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';

class SlidersComponentShimmer extends StatelessWidget {
  const SlidersComponentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      decoration: boxDecorationDefault(borderRadius: BorderRadius.circular(0)),
      child: Stack(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(left: 16, right: 96, bottom: 16, top: 16),
            alignment: Alignment.topLeft,
            decoration: boxDecorationDefault(borderRadius: BorderRadius.circular(0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget(
                  baseColor: shimmerLightBaseColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
                    decoration: boxDecorationDefault(),
                  ),
                ),
                ShimmerWidget(
                  baseColor: shimmerLightBaseColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
                    decoration: boxDecorationDefault(),
                  ),
                ).paddingOnly(right: 60, top: 8, bottom: 8),
                ShimmerWidget(
                  baseColor: shimmerLightBaseColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
                    decoration: boxDecorationDefault(),
                  ),
                ).paddingOnly(right: 60),
              ],
            ),
          ),
          ShimmerWidget(
            height: 200,
            baseColor: shimmerLightBaseColor,
            child: Container(
              width: Get.width,
              decoration: boxDecorationDefault(borderRadius: BorderRadius.circular(0)),
            ),
          ),
          Positioned(
            bottom: 28,
            left: 16,
            child: Row(
              children: [
                ShimmerWidget(
                  baseColor: shimmerLightBaseColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: boxDecorationDefault(),
                  ),
                ),
                ShimmerWidget(
                  baseColor: shimmerLightBaseColor,
                  child: const CircleWidget(height: 16, width: 16),
                ).paddingSymmetric(horizontal: 8),
                ShimmerWidget(
                  baseColor: shimmerLightBaseColor,
                  child: const CircleWidget(height: 16, width: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
