import 'dart:convert';
import 'dart:developer';
import 'package:pynk/Api_Service/constant.dart';
import 'package:pynk/Api_Service/story/model/create_story_model.dart';
import 'package:pynk/view/utils/settings/app_variables.dart';
import 'package:http/http.dart' as http;

class CreateStoryService {
  static var client = http.Client();

  static createStory() async {
    try {
      var uri = Uri.parse(Constant.baseUrl + Constant.createStory);
      print("createStory  uri ::: $uri  ");
      var request = http.MultipartRequest("POST", uri);

      if (on == true) {
        var addImage = await http.MultipartFile.fromPath('image', storyImage!.path);
        // var addVideo = await http.MultipartFile.fromPath('video', storyVideo!.path);
        print("createStory  addImage ::: $addImage  ");
        request.files.add(addImage);
        // request.files.add(addVideo);
      }

      request.headers.addAll({"key": Constant.key});
      print("createStory  loginUserId ::: $loginUserId  ");

      Map<String, String> requestBody = <String, String>{
        "hostId": loginUserId,
      };
       request.fields.addAll(requestBody);

      var res1 = await request.send();

      var res = await http.Response.fromStream(res1);

      log("Create Story Response :- ${res.statusCode}");
      log("Create Story Data Is :- ${res.body}");

      if (res.statusCode == 200) {
        return CreateStoryModel.fromJson(jsonDecode(res.body));

      } else {
        log(res.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
