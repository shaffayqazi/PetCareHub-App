import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';

class NewOrderCardShimmer extends StatelessWidget {
  const NewOrderCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - 32,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  ShimmerWidget(
                    baseColor: shimmerLightBaseColor,
                    child: Container(
                      margin: const EdgeInsets.only(left: 16, top: 16),
                      padding: const EdgeInsets.all(42),
                      decoration: boxDecorationDefault(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => const ShimmerWidget(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ).paddingSymmetric(horizontal: 16, vertical: 4),
                        ),
                      ),
                      ShimmerWidget(
                        child: Icon(
                          Icons.attach_money_rounded,
                          color: shimmerPrimaryBaseColor.withOpacity(0.4),
                        ),
                      ).paddingLeft(10)
                    ],
                  ).expand(),
                ],
              ).paddingTop(8),
              ShimmerWidget(
                child: Divider(
                  color: shimmerLightBaseColor,
                  indent: 16,
                  endIndent: 16,
                  height: 20,
                ),
              ),
              ...List.generate(
                2,
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
                ).paddingSymmetric(horizontal: 12, vertical: 4),
              )
            ],
          ).paddingTop(20).paddingBottom(8),
          ShimmerWidget(
            baseColor: shimmerLightBaseColor,
            child: Container(
              width: Get.width - 32,
              padding: const EdgeInsets.symmetric(vertical: 100),
              decoration: boxDecorationDefault(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: ShimmerWidget(
              baseColor: shimmerLightBaseColor,
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: boxDecorationDefault(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultRadius)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ShimmerWidget(
              baseColor: shimmerLightBaseColor,
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: boxDecorationDefault(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(defaultRadius)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
