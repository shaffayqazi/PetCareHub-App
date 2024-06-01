import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/circle_widget.dart';
import 'package:pawlly/components/screen_shimmer.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';

class SelectAddressScreenShimmer extends StatelessWidget {
  const SelectAddressScreenShimmer({Key? key}) : super(key: key);

  Widget AddressItemComponentShimmer() {
    return Container(
      width: Get.width - 32,
      decoration: boxDecorationDefault(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              ShimmerWidget(
                baseColor: shimmerLightBaseColor,
                child: const CircleWidget(
                  padding: EdgeInsets.all(12),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => const ShimmerWidget(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                ),
              ).expand(),
              const ShimmerWidget(padding: EdgeInsets.all(16)),
              16.width,
              const ShimmerWidget(padding: EdgeInsets.all(16))
            ],
          ).paddingSymmetric(horizontal: 16),
          ShimmerWidget(
            baseColor: shimmerLightBaseColor,
            child: Container(
              width: Get.width - 32,
              padding: const EdgeInsets.symmetric(vertical: 48),
              decoration: boxDecorationDefault(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenShimmer(shimmerComponent: AddressItemComponentShimmer().paddingLeft(16));
  }
}
