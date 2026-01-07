import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pynk/Api_Service/controller/setting_controller.dart';
import 'package:pynk/view/utils/settings/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HostAboutUsScreen extends StatefulWidget {
  const HostAboutUsScreen({super.key});

  @override
  State<HostAboutUsScreen> createState() => _HostAboutUsScreenState();
}

class _HostAboutUsScreenState extends State<HostAboutUsScreen> {
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
          highlightColor: AppColors.transparentColor,
          splashColor: AppColors.transparentColor,
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
                    return 
                     WebViewWidget(
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
                          Uri.parse(settingController.getSetting!.setting!.termAndCondition ?? ''),
                        ),
                    );
                    // WebView(
                    //   onPageStarted: (url) {},
                    //   initialUrl: settingController.getSetting!.setting!.termAndCondition ?? '',
                    //   javascriptMode: JavascriptMode.unrestricted,
                    // );
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
