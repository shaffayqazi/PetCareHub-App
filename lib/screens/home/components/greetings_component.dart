import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pawlly/utils/common_base.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import '../../../utils/app_common.dart';
import '../../auth/other/notification_screen.dart';
import '../../pet/my_pets_controller.dart';
import 'dart:math';

class GreetingsComponent extends StatelessWidget {
  const GreetingsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                '${locale.value.hello}, ${loginUserData.value.userName.isNotEmpty ? loginUserData.value.userName : locale.value.guest} 👋',
                style: primaryTextStyle(size: 20),
              ),
            ).paddingTop(16),
            Obx(
              () => Text(
                '${locale.value.howS} $randomPetName ${locale.value.healthGoingOn}',
                style: secondaryTextStyle(),
              ).visible(randomPetName.isNotEmpty),
            ).paddingTop(4),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.to(() => NotificationScreen());
          },
          icon: Assets.iconsIcUnselectedBell.iconImage(color: darkGray, size: 24),
        ).paddingTop(16).visible(isLoggedIn.value),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  String get randomPetName {
    try {
      if (myPetsScreenController.myPets.isNotEmpty) {
        return myPetsScreenController.myPets[Random().nextInt(myPetsScreenController.myPets.length)].name;
      } else {
        return "";
      }
    } catch (e) {
      log('randomPetName E: $e');
      return "";
    }
  }
}
