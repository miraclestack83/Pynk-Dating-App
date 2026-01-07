import 'dart:convert';
import 'dart:developer';
import 'package:pynk/Api_Service/constant.dart';
import 'package:pynk/Api_Service/model/fetch_live_host_model.dart';
import 'package:http/http.dart' as http;

class FetchLiveHostService {
  static var client = http.Client();

  static Future<FetchLiveHostModel>  fetchLiveHost(String hostId) async {
    try {
      var uri = Uri.parse(Constant.baseUrl + Constant.fetchLiveHost);
      log("message uri $uri");
      var payload = json.encode({
        "hostId": hostId,
      }.map((key, value) => MapEntry(key, value.toString())));
      log("message payload $payload");
      final response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "key": Constant.key
          },
          body: payload);
      log("message response.body ${response.body}");
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return FetchLiveHostModel.fromJson(data);
      } else {
        log(response.statusCode.toString());
      }
      return FetchLiveHostModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
