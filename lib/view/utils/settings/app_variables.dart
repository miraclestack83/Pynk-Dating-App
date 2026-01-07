import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'app_images.dart';

bool isOnBoarding = true;
bool isBottom = false;
bool isObSecured = true;
bool isNum = false;

bool videoButtonIs = true;

int selectedIndex = 0;
int hostSelectedIndex = 0;

int initialIndex = 0;
PageController pageController = PageController(initialPage: 0);

//////////////////////////API_Services///////////////////////////////

const getEmoji = "609e13ef24e2c64a77d99220";
const getLoveBirds = "609e143224e2c64a77d99245";
File? hostImage;
File? createComplainImage;
File? getUserProfileImage;
File? createChatImage;
File? fetchHostImage;
File? hostRequestImage;
File? hostRequestVideo;
File? hostAlbumImage;
File? userComplainImage;
File? hostComplainImage;
bool on = false;

////////////////////////////////////////////////////////////////////////////////

List userprofileImageList = [
  AppImages.storyModel1,
  AppImages.storyModel2,
  AppImages.storyModel5,
  AppImages.storyModel4,
  AppImages.storyModel3,
];

const appId = "8704dbf934e143e5bba2d3d3f853064b";
const token =
    "";
const channelName = "ram";

enum ImageSourceType { gallery, camera }

bool switchPage = true;
bool switchHostScreen = true;
bool switchComplain = true;
String country = "Global";
bool switchCamera = false;
bool isSwitch = false;
bool navMatch = true;
bool isProfile = true;
bool isStoryProfile = true;
bool isMatchCall = true;
bool isMatch = true;
bool isDisable = true;
bool isVideo = true;
bool isStory = true;
bool hostVideo = true;
// late File imageFile;

List<CameraDescription> cameras = [];

late CameraController cameraController;

List<File> selectedImage = [];
List<File> hostProfileList = [];
List<File> selectedProfileImage = [];

String androidId = "";
String fcmToken = "";
const String homeRoute = '/';

List flairImage = [];
List flameImage = [];
List heartImage = [];
List emojiImage = [];
List loveBirdsImage = [];

List commentBlankImage = ["assets/images/flairImage.png"];

bool visibleHost = true;

////// Real User Data/////
String userName = "Pynk User";
String userGender = "Female";
String userBio = "I m Pynk user";
String userImage = AppImages.userProfile;
String userDob = "2023-03-10 11:02:15.252970";
String countryProfile = "India";

String loginUserId = '';
String uniqueId = '';
String getLiveHostId = "";
String getLiveRoomId = "";
RxString userCoin = "".obs;
RxString hostCoin = "".obs;
bool isHost = false;
bool isLogin = false;
bool userIsBlock = false;
bool hostIsBlock = false;
bool isAppActive = true;
String coinPerDollarIs = "";
List hostAlbum = [];
List tempChatList = [];
String hostId = '';

String hostCoverImage = AppImages.userProfile;

///// gift_category //////
String toysId = "";
String loveId = "";

///// API ////
Map fetchBanner = {};
Map fetchCountry = {};

////// socket /////
late IO.Socket socket;
late IO.Socket liveSocket;

/////// bool_variables ////
bool isOnline = true;
bool isBroadCast = false;

////// chat data /////
String chatUserId = "";
String chatRoomId = "";
String chatHostId = "";
String storyId = "";

/////// video call data /////
String callId = "";


String publishableKey = "";
String secretKey = "";

// String razorPayKey = "rzp_test_hi7nQyByRkoLYU";

bool sandboxVerifyReceiptUrl = true;

String razorPayKey = "";

bool razorPayIsActive = true;
bool stripePayIsActive = true;
bool googlePayIsActive = true;

///////// File_data /////////
File? storyImage;

///// notification global variable ///////
FirebaseMessaging? messaging;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
bool notificationVisit = false;

///// VOICE MESSAGE ////////
class Globals {
  Globals._();

  static init() async {
    documentPath = "${(await getApplicationDocumentsDirectory()).path}/";
  }

  static String documentPath = '';
  static GlobalKey<AnimatedListState> audioListKey = GlobalKey<AnimatedListState>();
}

//// App Was Background and App Foreground ///
var bgcall = false.obs;
