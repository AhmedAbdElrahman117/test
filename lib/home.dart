import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/fawry_utils.dart';
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_merchant_model.dart';
import 'package:fawry_sdk/model/payment_methods.dart';
import 'package:fawry_sdk/model/response.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription? _fawryCallbackResultStream;

  @override
  void initState() {
    initSDKCallback();
    super.initState();
  }

  Future<void> initSDKCallback() async {
    try {
      _fawryCallbackResultStream =
          FawrySDK.instance.callbackResultStream().listen((event) {
        setState(() {
          ResponseStatus response = ResponseStatus.fromJson(jsonDecode(event));
          handleResponse(response);
        });
      });
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  void handleResponse(ResponseStatus response) {
    switch (response.status) {
      case FawrySDK.RESPONSE_SUCCESS:
        {
          debugPrint('Message: ${response.message}');
          debugPrint('Json Response: ${response.data}');
        }
        break;
      case FawrySDK.RESPONSE_ERROR:
        {
          debugPrint('Error: ${response.message}');
        }
        break;
      case FawrySDK.RESPONSE_PAYMENT_COMPLETED:
        {
          debugPrint(
              'Payment Completed: ${response.message}, ${response.data}');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              BillItem item = BillItem(
                itemId: 'Item1',
                description: 'Book',
                quantity: 6,
                price: 50,
              );

              List<BillItem> chargeItems = [item];

              LaunchMerchantModel merchantModel = LaunchMerchantModel(
                merchantCode: 'YOUR MERCHANT CODE',
                merchantRefNum: FawryUtils.randomAlphaNumeric(10),
                secureKey: 'YOUR SECURE KEY',
              );

              FawryLaunchModel model = FawryLaunchModel(
                allow3DPayment: true,
                chargeItems: chargeItems,
                launchMerchantModel: merchantModel,
                skipLogin: true,
                skipReceipt: true,
                payWithCardToken: false,
                paymentMethods: PaymentMethods.ALL,
              );

              String baseUrl = "https://atfawry.fawrystaging.com/";

              await startPayment(model, baseUrl);
            },
            child: Text('data'),
          ),
        ),
      ),
    );
  }

  Future<void> startPayment(FawryLaunchModel model, String baseUrl) async {
    await FawrySDK.instance.startPayment(
      launchModel: model,
      baseURL: baseUrl,
      lang: FawrySDK.LANGUAGE_ENGLISH,
    );
  }
}
