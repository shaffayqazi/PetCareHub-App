import 'package:flutter/material.dart';
import 'package:pawlly/components/screen_shimmer.dart';
import 'package:pawlly/screens/shop/order/new_order_card_shimmer.dart';

class NewOrderScreenShimmer extends StatelessWidget {
  const NewOrderScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenShimmer(shimmerComponent: NewOrderCardShimmer());
  }
}
