import 'package:dio/dio.dart';

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
}
