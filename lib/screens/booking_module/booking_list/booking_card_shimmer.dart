import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/circle_widget.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';
import 'package:pawlly/utils/common_base.dart';

class BookingCardShimmer extends StatelessWidget {
  final bool isFromHome;
  const BookingCardShimmer({super.key, this.isFromHome = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, bottom: isFromHome ? 0 : 16),
          decoration: boxDecorationDefault(color: context.cardColor, shape: BoxShape.rectangle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              16.height,
              const Align(
                alignment: Alignment.center,
                child: ShimmerWidget(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  width: 100,
                ),
              ),
              16.height.visible(isFromHome),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 42, vertical: 8)),
                  8.width,
                  const ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 42, vertical: 8)),
                ],
              ).visible(isFromHome),
              16.height,
              ShimmerWidget(
                baseColor: shimmerLightBaseColor,
                child: commonDivider,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  16.width,
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        8.height,
                        ShimmerWidget(
                          baseColor: shimmerLightBaseColor,
                          child: const CircleWidget(
                            height: 54,
                            width: 54,
                          ),
                        ),
                        16.height,
                        const ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      8.height,
                      ...List.generate(
                        4,
                        (index) => const ShimmerWidget(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ).paddingSymmetric(vertical: 4, horizontal: 24),
                      ),
                    ],
                  ).expand(),
                ],
              ),
              12.height,
              const ShimmerWidget(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24)).paddingSymmetric(horizontal: 16),
              16.height,
            ],
          ).paddingTop(32),
        ).paddingOnly(top: 8, bottom: 16),
        Positioned(
          top: -2,
          left: Get.width * 0.163,
          right: Get.width * 0.163,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: boxDecorationDefault(borderRadius: BorderRadius.circular(40), color: context.scaffoldBackgroundColor),
            child: const ShimmerWidget(
              height: 42,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            ).cornerRadiusWithClipRRect(40),
          ),
        ),
      ],
    );
  }
}
