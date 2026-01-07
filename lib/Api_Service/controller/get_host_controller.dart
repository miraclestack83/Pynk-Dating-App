import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/model/get_host_model.dart';
import 'package:pynk/Api_Service/service/get_host_service.dart';
import 'package:pynk/view/utils/settings/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetHostController extends GetxController {
  GetHostModel? getHostData;
  var isLoading = true.obs;

  Future getHost(String hostId) async {
    log("Get host Controller called");
    try {
      isLoading(true);
      getHostData = await GetHostService.getHost(hostId);
      log("Get Host: ${jsonEncode(getHostData)}");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isHost", getHostData?.host?.isHost??false);
      isHost = preferences.getBool("isHost")??false;
      print("Is Host $isHost");
      if (getHostData!.status == true) {
        isLoading(false);
      }
    } finally {}
  }
}
