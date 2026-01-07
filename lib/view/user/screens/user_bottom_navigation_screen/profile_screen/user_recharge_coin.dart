import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pynk/view/Utils/Settings/app_images.dart';
import 'package:pynk/view/utils/settings/app_colors.dart';

class UserRechargeCoinsScreen extends StatefulWidget {
  const UserRechargeCoinsScreen({super.key});

  @override
  State<UserRechargeCoinsScreen> createState() => _UserRechargeCoinsScreenState();
}

class _UserRechargeCoinsScreenState extends State<UserRechargeCoinsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Recharge Coins",style: TextStyle(color: AppColors.pinkColor,fontWeight: FontWeight.bold,fontSize: 20,),),
        backgroundColor: AppColors.appBarColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.pinkColor),
        ),
      ),

      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:    const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.appBackground),
            fit: BoxFit.cover,
          ),
        ),
      ),

    );
  }
}
