// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  bool? status;
  String? message;
  Setting? setting;

  SettingModel({
    this.status,
    this.message,
    this.setting,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    status: json["status"],
    message: json["message"],
    setting: json["setting"] == null ? null : Setting.fromJson(json["setting"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "setting": setting?.toJson(),
  };
}

class Setting {
  String? id;
  String? agoraKey;
  String? agoraCertificate;
  String? privacyPolicyLink;
  String? privacyPolicyText;
  String? termAndCondition;
  String? googlePlayEmail;
  String? googlePlayKey;
  bool? googlePlaySwitch;
  bool? stripeSwitch;
  String? stripePublishableKey;
  String? stripeSecretKey;
  bool? isAppActive;
  String? welcomeMessage;
  String? razorPayId;
  bool? razorPaySwitch;
  String? razorSecretKey;
  int? chargeForRandomCall;
  int? chargeForPrivateCall;
  int? coinPerDollar;
  int? coinCharge;
  List<String>? paymentGateway;
  int? withdrawLimit;
  String? link;
  bool? isFake;
  String? redirectAppUrl;
  String? redirectMessage;

  Setting({
    this.id,
    this.agoraKey,
    this.agoraCertificate,
    this.privacyPolicyLink,
    this.privacyPolicyText,
    this.termAndCondition,
    this.googlePlayEmail,
    this.googlePlayKey,
    this.googlePlaySwitch,
    this.stripeSwitch,
    this.stripePublishableKey,
    this.stripeSecretKey,
    this.isAppActive,
    this.welcomeMessage,
    this.razorPayId,
    this.razorPaySwitch,
    this.razorSecretKey,
    this.chargeForRandomCall,
    this.chargeForPrivateCall,
    this.coinPerDollar,
    this.coinCharge,
    this.paymentGateway,
    this.withdrawLimit,
    this.link,
    this.isFake,
    this.redirectAppUrl,
    this.redirectMessage,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
    id: json["_id"],
    agoraKey: json["agoraKey"],
    agoraCertificate: json["agoraCertificate"],
    privacyPolicyLink: json["privacyPolicyLink"],
    privacyPolicyText: json["privacyPolicyText"],
    termAndCondition: json["termAndCondition"],
    googlePlayEmail: json["googlePlayEmail"],
    googlePlayKey: json["googlePlayKey"],
    googlePlaySwitch: json["googlePlaySwitch"],
    stripeSwitch: json["stripeSwitch"],
    stripePublishableKey: json["stripePublishableKey"],
    stripeSecretKey: json["stripeSecretKey"],
    isAppActive: json["isAppActive"],
    welcomeMessage: json["welcomeMessage"],
    razorPayId: json["razorPayId"],
    razorPaySwitch: json["razorPaySwitch"],
    razorSecretKey: json["razorSecretKey"],
    chargeForRandomCall: json["chargeForRandomCall"],
    chargeForPrivateCall: json["chargeForPrivateCall"],
    coinPerDollar: json["coinPerDollar"],
    coinCharge: json["coinCharge"],
    paymentGateway: json["paymentGateway"] == null ? [] : List<String>.from(json["paymentGateway"]!.map((x) => x)),
    withdrawLimit: json["withdrawLimit"],
    link: json["link"],
    isFake: json["isFake"],
    redirectAppUrl: json["redirectAppUrl"],
    redirectMessage: json["redirectMessage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "agoraKey": agoraKey,
    "agoraCertificate": agoraCertificate,
    "privacyPolicyLink": privacyPolicyLink,
    "privacyPolicyText": privacyPolicyText,
    "termAndCondition": termAndCondition,
    "googlePlayEmail": googlePlayEmail,
    "googlePlayKey": googlePlayKey,
    "googlePlaySwitch": googlePlaySwitch,
    "stripeSwitch": stripeSwitch,
    "stripePublishableKey": stripePublishableKey,
    "stripeSecretKey": stripeSecretKey,
    "isAppActive": isAppActive,
    "welcomeMessage": welcomeMessage,
    "razorPayId": razorPayId,
    "razorPaySwitch": razorPaySwitch,
    "razorSecretKey": razorSecretKey,
    "chargeForRandomCall": chargeForRandomCall,
    "chargeForPrivateCall": chargeForPrivateCall,
    "coinPerDollar": coinPerDollar,
    "coinCharge": coinCharge,
    "paymentGateway": paymentGateway == null ? [] : List<dynamic>.from(paymentGateway!.map((x) => x)),
    "withdrawLimit": withdrawLimit,
    "link": link,
    "isFake": isFake,
    "redirectAppUrl": redirectAppUrl,
    "redirectMessage": redirectMessage,
  };
}
