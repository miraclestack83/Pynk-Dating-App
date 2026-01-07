import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pynk/Payment_Method/stripe_pay.dart';
import 'package:pynk/view/Utils/Settings/app_images.dart';
import 'package:pynk/view/user/screens/user_bottom_navigation_screen/user_bottom_navigation_screen.dart';
import 'package:pynk/view/utils/settings/app_colors.dart';
import 'package:pynk/view/utils/settings/app_variables.dart';
import 'package:pynk/view/utils/widgets/common_button.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../../Payment_Method/in_app_purchase/iap_callback.dart';
import '../../../../../../Payment_Method/in_app_purchase/in_app_purchase_helper.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayScreen extends StatefulWidget {
  final String planId;
  final String coin;
  final String amount;
  final String productKey;

  const PayScreen(
      {super.key, required this.planId, required this.coin, required this.amount, required this.productKey});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> implements IAPCallback {
  bool isAbsorbing = false;
  String selectedPayment = "GooglePlay";
  String selectedValue = "GooglePlay";
  var stripePayController = StripeService();
  late Razorpay razorpay;

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    InAppPurchaseHelper().getAlreadyPurchaseItems(this);
    purchases = InAppPurchaseHelper().getPurchases();
    InAppPurchaseHelper().clearTransactions();
    super.initState();
  }

  /// Razor Pay Success function ///
  Future<void> _handlePaymentSuccess(
    PaymentSuccessResponse response,
  ) async {
    Fluttertoast.showToast(msg: "SUCCESS: ${response.paymentId!}", timeInSecForIosWeb: 4);

    int coinUpdate = int.parse(userCoin.value) + int.parse(widget.coin);
    userCoin.value = "$coinUpdate";

    log("Razor pay Coin Update is :- ${userCoin.value}");

    await coinHistoryController.coinPlanHistory(loginUserId, widget.planId, "RazorPay");
    selectedIndex = 0;
    Get.offAll(() => const UserBottomNavigationScreen());
  }

  /// Razor Pay error function ///
  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: ${response.code} - ${response.message}", timeInSecForIosWeb: 4);
  }

  /// Razor Pay Wallet  function ///
  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: ${response.walletName}",
      timeInSecForIosWeb: 4,
    );
  }

  /// Razor Pay ///
  void openCheckout() {
    var options = {
      // "key": "rzp_live_QEJM1AlKufkctY",
      "key": "rzp_test_hi7nQyByRkoLYU",
      "amount": num.parse(widget.amount) * 100,
      // "amount": num.parse(widget.amount) * 100,
      'currency': 'USD',
      "name": "Pynk",
      "description": "Payment For any product",
      "prefill": {
        "contact": "",
        "email": "",
      },
      "external": {
        "wallets": ["gpay"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  Map<String, PurchaseDetails>? purchases;

  @override
  Widget build(BuildContext context) {
    log(widget.planId);
    log("Selected Amount is :- ${widget.amount}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Pay",
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
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.appBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(AppImages.rechargeCoin))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.coin,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 480,
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color(0xff343434).withOpacity(0.50),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedValue = "GooglePlay";
                            selectedPayment = selectedValue;
                            log(selectedPayment);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(AppImages.googlePay1, fit: BoxFit.contain),
                                ),
                                const SizedBox(width: 30),
                                const Text(
                                  "GooglePlay",
                                  style: TextStyle(
                                      color: AppColors.lightPinkColor, fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 1.2,
                              child: Radio(
                                  activeColor: AppColors.pinkColor,
                                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                                  value: "GooglePlay",
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                      log("===$value");
                                      selectedPayment = selectedValue;
                                      log(selectedPayment);
                                    });
                                  }),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Color(0xff555555),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedValue = "RazorPay";
                            selectedPayment = selectedValue;
                            log(selectedPayment);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(AppImages.razorPay1, fit: BoxFit.contain),
                                ),
                                const SizedBox(width: 30),
                                const Text(
                                  "RazorPay",
                                  style: TextStyle(
                                      color: AppColors.lightPinkColor, fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 1.2,
                              child: Radio(
                                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                                  activeColor: AppColors.pinkColor,
                                  value: "RazorPay",
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                      log("===$value");
                                      selectedPayment = selectedValue;
                                      log(selectedPayment);
                                    });
                                  }),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Color(0xff555555),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedValue = "Stripe";
                            selectedPayment = selectedValue;
                            log(selectedPayment);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(AppImages.stripePay1, fit: BoxFit.contain),
                                  ),
                                  const SizedBox(width: 30),
                                  const Text(
                                    "Stripe",
                                    style: TextStyle(
                                      color: AppColors.lightPinkColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.scale(
                              scale: 1.2,
                              child: Radio(
                                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                                  activeColor: AppColors.pinkColor,
                                  value: "Stripe",
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      log("=======$value");
                                      selectedValue = value!;
                                      selectedPayment = selectedValue;
                                      log(selectedPayment);
                                    });
                                  }),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 30),
                  const Spacer(),
                  AbsorbPointer(
                    absorbing: isAbsorbing,
                    child: CommonButton(
                      text: "Pay",
                      onTap: () async {
                        await Fluttertoast.showToast(
                          msg: "Redirecting...",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black.withOpacity(0.35),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        setState(() {
                          isAbsorbing = true;
                          log("==============isAbsorbing is :- $isAbsorbing");
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isAbsorbing = false;
                              log("==============isAbsorbing is :- $isAbsorbing");
                            });
                          });
                        });

                        if (selectedPayment == "Stripe") {
                          stripePayController.makePayment(
                            coin: widget.coin,
                            amount: widget.amount,
                            currency: "USD",
                            coinPlanId: widget.planId,
                          );
                        } else if (selectedPayment == "RazorPay") {
                          openCheckout();
                        } else {
                          List<String> kProductIds = <String>[widget.productKey];
                          await InAppPurchaseHelper()
                              .init(coinPlanId: widget.planId, productId: kProductIds, coin: widget.coin);

                          log("Initialization completed");
                          InAppPurchaseHelper().initStoreInfo();

                          await Future.delayed(const Duration(seconds: 1));

                          ProductDetails? product = InAppPurchaseHelper().getProductDetail(widget.productKey);
                          log("Product is :: $product");
                          if (product != null) {
                            log("Product details retrieved successfully for :: ${product.id}");
                            InAppPurchaseHelper().buySubscription(product, purchases!);
                          } else {
                            log("Product is null for :: ${widget.productKey}");
                          }

                          // Get.to(() => const CustomInAppPurchase());
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///This is not usable but if you remove it then google pay shit not open
  @override
  void onBillingError(error) {
    // TODO: implement onBillingError
  }

  @override
  void onLoaded(bool initialized) {
    // TODO: implement onLoaded
  }

  @override
  void onPending(PurchaseDetails product) {
    // TODO: implement onPending
  }

  @override
  void onSuccessPurchase(PurchaseDetails product) {
    // TODO: implement onSuccessPurchase
  }
}
