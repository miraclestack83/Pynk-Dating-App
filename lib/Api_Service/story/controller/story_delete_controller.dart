import 'package:get/get.dart';
import 'package:pynk/Api_Service/story/service/delete_story_service.dart';


class DeleteStoryController extends GetxController {

  Future deleteStoryIs (String storyId) async {
    await DeleteStoryService.deleteStory(storyId);
  }
}
