import 'package:get/get.dart';
import 'package:pynk/Api_Service/story/model/create_view_story_model.dart';
import 'package:pynk/Api_Service/story/service/create_view_story_service.dart';

class CreateViewStoryController extends GetxController {

  CreateViewStoryModel? createViewStoryData;

  Future createViewStoryIs (String storyId, String userId) async {
    createViewStoryData = await CreateViewStoryService.createViewStory(storyId, userId);
  }
}
