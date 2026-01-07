import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/model/setting_model.dart';
import 'package:pynk/Api_Service/service/setting_service.dart';

class SettingController extends GetxController {
  SettingModel? getSetting;
  var isLoading = true.obs;
  

  Future setting() async {
    try {
      isLoading(true);
      getSetting = await SettingService.getSetting();
      log("Setting Data:- ${jsonEncode(getSetting)}");
      if (getSetting!.status == true) {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
