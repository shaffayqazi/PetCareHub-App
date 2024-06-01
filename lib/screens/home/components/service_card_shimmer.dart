import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/components/circle_widget.dart';
import 'package:pawlly/components/shimmer_widget.dart';
import 'package:pawlly/utils/colors.dart';

class ServiceCardShimmer extends StatelessWidget {
  final double width;
  final double height;
  const ServiceCardShimmer({super.key, 
    this.width = 130,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: boxDecorationDefault(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerWidget(
                baseColor: shimmerLightBaseColor,
                child: const CircleWidget(height: 64, width: 64),
              ),
              ShimmerWidget(
                baseColor: shimmerLightBaseColor,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  decoration: boxDecorationDefault(),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 16),
          ShimmerWidget(
            baseColor: shimmerLightBaseColor,
            width: width,
            height: height,
            child: Container(
              decoration: boxDecorationDefault(),
            ),
          )
        ],
      ),
    );
  }
}
