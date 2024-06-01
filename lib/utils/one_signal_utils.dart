import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawlly/screens/auth/services/auth_service_apis.dart';

import '../screens/booking_module/booking_detail/booking_detail_screen.dart';
import '../screens/booking_module/model/booking_data_model.dart';
import '../screens/dashboard/dashboard_res_model.dart';
import '../screens/shop/order/model/order_detail_model.dart';
import '../screens/shop/order/order_detail_screen.dart';
import 'app_common.dart';
import 'constants.dart';

bool isOneSignalInitilaized = false;

Future<void> initOneSignal() async {
  if (!isOneSignalInitilaized && appConfigs.value.onesignalCustomerApp.onesignalAppId.isNotEmpty) {
    ///Initialize
    OneSignal.initialize(appConfigs.value.onesignalCustomerApp.onesignalAppId);
    log('OneSignal Initialized');

    await Future.delayed(const Duration(seconds: 1));
    OneSignal.User.pushSubscription.optIn();

    ///Handle Navigation
    OneSignal.Notifications.addClickListener((event) {
      try {
        log("notification data===> ${event.jsonRepresentation()}");
        if (event.notification.additionalData != null) {
          final additionalData = event.notification.additionalData!['additional_data'];

          if (event.notification.additionalData!['additional_data'].containsKey('id')) {
            int? notId = event.notification.additionalData!['additional_data']["id"];
            if (notId != null) {
              if (event.notification.additionalData!['additional_data']['notification_group'] == 'shop') {
                Get.to(() => OrderDetailScreen(), arguments: OrderListData(id: notId, orderCode: additionalData['order_code']));
              } else {
                Get.to(() => BookingDetailScreen(), arguments: BookingDataModel(id: notId, service: SystemService(name: additionalData['booking_services_names']), payment: PaymentDetails(), training: Training()));
              }
            }
          }
        }
      } catch (e) {
        log('OneSignal addClickListener E: $e');
      }
    });

    isOneSignalInitilaized = true;

    ///Save Player Id to Backend
    saveOneSignalPlayerId();
  }
}

Future<void> saveOneSignalPlayerId() async {
  if (isLoggedIn.value) {
    OneSignal.User.addTagWithKey(UserKeys.email, loginUserData.value.email);

    await OneSignal.login(loginUserData.value.id.toString()).then((value) {
      if (OneSignal.User.pushSubscription.id.validate().isNotEmpty) {
        playerId(OneSignal.User.pushSubscription.id);
        log('PLAYERID: ${playerId.value}');
        AuthServiceApis.updateProfile(playerId: playerId.value).catchError((e) {
          log('saveOneSignalPlayerId updateProfile E: $e');
        });
      }
    }).catchError((e) {
      log('Error saving subscription id - $e');
    });
  }
}
