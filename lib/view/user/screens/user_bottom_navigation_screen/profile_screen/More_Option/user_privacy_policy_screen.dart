import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/controller/setting_controller.dart';

import 'package:pynk/view/utils/settings/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserPrivacyPolicyScreen extends StatefulWidget {
  const UserPrivacyPolicyScreen({super.key});

  @override
  State<UserPrivacyPolicyScreen> createState() =>
      _UserPrivacyPolicyScreenState();
}

class _UserPrivacyPolicyScreenState extends State<UserPrivacyPolicyScreen> {
  SettingController settingController = Get.put(SettingController());
  @override
  void initState() {
    settingController.setting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            color: AppColors.pinkColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.appBarColor,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.pinkColor),
        ),
      ),
      body: Obx(
        () {
          if (settingController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return WebViewWidget(
                        controller: WebViewController()
                          ..setJavaScriptMode(JavaScriptMode.unrestricted)
                          ..setBackgroundColor(const Color(0x00000000))
                          ..setNavigationDelegate(
                            NavigationDelegate(
                              onProgress: (int progress) {
                                // Update loading bar.
                              },
                              onPageStarted: (String url) {},
                              onPageFinished: (String url) {},
                              onWebResourceError: (WebResourceError error) {},
                              onNavigationRequest: (NavigationRequest request) {
                                if (request.url
                                    .startsWith('https://www.youtube.com/')) {
                                  return NavigationDecision.prevent;
                                }
                                return NavigationDecision.navigate;
                              },
                            ),
                          )
                          ..loadRequest(Uri.parse(settingController.getSetting!.setting!.privacyPolicyLink ?? ''))
                        // onPageStarted: (url) {},
                        // initialUrl: settingController.getSetting!.setting!.privacyPolicyLink ?? '',
                        // javascriptMode: JavascriptMode.unrestricted,
                        );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
