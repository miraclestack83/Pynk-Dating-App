import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/controller/setting_controller.dart';
import 'package:pynk/view/utils/settings/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserAboutUsScreen extends StatefulWidget {
  const UserAboutUsScreen({super.key});

  @override
  State<UserAboutUsScreen> createState() => _UserAboutUsScreenState();
}

class _UserAboutUsScreenState extends State<UserAboutUsScreen> {
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
          "About Us",
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
                        ..loadRequest(
                          Uri.parse(settingController
                                  .getSetting!.setting!.termAndCondition ??
                              ''),
                        ),
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
