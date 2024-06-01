import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/screen_shimmer.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';

class BookingDetailScreenShimmer extends StatelessWidget {
  const BookingDetailScreenShimmer({Key? key}) : super(key: key);

  Widget customerInformationComponentShimmer(BuildContext ctx) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 48, vertical: 8)),
        16.height,
        Stack(
          children: [
            ShimmerWidget(
              baseColor: shimmerLightBaseColor,
              child: Container(
                height: 130,
                width: Get.width - 16,
                padding: const EdgeInsets.all(16),
                decoration: boxDecorationDefault(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                16.height,
                ...List.generate(
                  5,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ShimmerWidget(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ).expand(flex: 3),
                      const Spacer(),
                      const ShimmerWidget(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ).expand(flex: 3)
                    ],
                  ).paddingSymmetric(horizontal: 12, vertical: 2),
                ),
              ],
            ),
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenShimmer(
      itemCount: 5,
      shimmerComponent: customerInformationComponentShimmer(context),
    );
  }
}
