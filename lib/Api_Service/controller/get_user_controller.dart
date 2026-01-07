import 'dart:convert';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/model/get_user_model.dart';
import 'package:pynk/Api_Service/service/get_user_service.dart';
import 'package:pynk/view/utils/settings/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserController extends GetxController {
  GetUserModel? getUserData;

  Future getUser(String userId) async {
    getUserData = await GetUserService.getUser(userId);
    if (getUserData!.status == true) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("userCoin", getUserData!.findUser!.coin.toString());
      userCoin.value = preferences.getString("userCoin")!;
    }
    print("Get User: ${jsonEncode(getUserData)}");
  }
}
