import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/model/host_thumb_list_model.dart';
import 'package:pynk/Api_Service/service/fetch_host_thumb_service.dart';

class HostThumbController extends GetxController {
  var hostThumbList = <Host>[].obs;
  var isLoading = true.obs;

  Future fetchHostThumb(String country) async {
    try {
      isLoading(true);
      var hostThumbData = await HostThumbService.hostThumbList(country);
      if (hostThumbData.status == true) {
        isLoading(false);
      }
      hostThumbList.value = hostThumbData.host!;
      log("Host Thumb List:- ${jsonEncode(hostThumbData)}");
      log("Host Thumb Host length :: ${jsonEncode(hostThumbData.host!.length)}");
    } finally {
      isLoading(false);
    }
  }
}
