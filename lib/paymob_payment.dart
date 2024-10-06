import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymobPayment {
  final dio = Dio();

  authenticate() async {
    var response = await dio.post(
      'https://accept.paymob.com/api/auth/tokens',
      data: {
        "username": "01000512414",
        "password": "1172003Ahmed#",
      },
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data['token'];
  }

  paymentIntent() async {
    var respone = await dio.post(
      'https://accept.paymob.com/v1/intention/',
      options: Options(
        headers: {
          "Authorization":
              "Token egy_sk_test_f09477b7396588eebd143ce9dde9ae04efd7c5eeefe5d39045001cf5645b19d5",
        },
      ),
      data: {
        "amount": 2000,
        "currency": "EGP",
        "payment_methods": ["ahmed"], ////Enter your integration id
        "items": [
          {
            "name": "Item name",
            "amount": 2000,
            "description": "Item description",
            "quantity": 1
          }
        ],
        "billing_data": {
          "apartment": "dumy",
          "first_name": "ala",
          "last_name": "zain",
          "street": "dumy",
          "building": "dumy",
          "phone_number": "+923459989111",
          "city": "dumy",
          "country": "dumy",
          "email": "ali@gmail.com",
          "floor": "dumy",
          "state": "dumy"
        }
      },
    );
    return respone.data['payment_keys'][0]['key'];
  }

  openCardPaymentPage(String paymentToken) async {
    Uri url = Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/873090?payment_token=$paymentToken');
    await launchURL(url);
  }

  openWalletPaymentPage(String paymentToken) async {
    Uri url = Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/873092?payment_token=$paymentToken');
    await launchURL(url);
  }

  launchURL(Uri link) async {
    await launchUrl(
      link,
      mode: LaunchMode.platformDefault,
    );
  }

  void paymentFlow(bool isCard) async {
    await authenticate();
    var paymentToken = await paymentIntent();
    if (isCard) {
      await openCardPaymentPage(paymentToken);
    } else {
      await openWalletPaymentPage(paymentToken);
    }
  }
}
