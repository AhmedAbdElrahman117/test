import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:test/paymob_payment.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Choose Payment Method'),
              ElevatedButton(
                onPressed: () {
                  FlutterPaymob.instance.payWithCard(
                    context:
                        context, // Passes the BuildContext required for UI interactions
                    currency:
                        "EGP", // Specifies the currency for the transaction (Egyptian Pound)
                    amount:
                        100, // Sets the amount of money to be paid (100 EGP)
                    // Optional callback function invoked when the payment process is completed
                    onPayment: (response) {
                      // Checks if the payment was successful
                      if (response.success == true) {
                        // If successful, displays a snackbar with the success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response.message ??
                                "Success"), // Shows "Success" message or response message
                          ),
                        );
                      }
                    },
                  );
                },
                child: Text('Card'),
              ),
              ElevatedButton(
                onPressed: () {
                  FlutterPaymob.instance.payWithWallet(
                    context: context,
                    currency: "EGP",
                    amount: 100,
                    number: "01010101010",
                    onPayment: (response) {},
                  );
                },
                child: Text('Wallet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
