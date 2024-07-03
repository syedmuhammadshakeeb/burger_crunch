import 'dart:convert';
import 'package:burger_crunch/Views/final_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class stripepayment extends GetxController {
  late Map<String, dynamic> paymentIntent;
  makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            currencyCode: 'US',
            testEnv: true,
          ),
          merchantDisplayName: 'shakeeb',
        ),
      );
      await Stripe.instance
          .presentPaymentSheet(); // Call here after initialization
    } catch (e) {
      print('payment ${e.toString()}');
    } finally {
      Get.to(const FinalPage());
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        'amount': '100000',
        'currency': 'USD',
        'payment_method_types[]': 'card',
      };
      final response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51PW1OkE4L5MMA5zj4A1e2yB9oC45ZCNGhIVPRTb2VLnvcNp9smkhHalux92mh3b1vSzDei3FqIs7ARRdWnuXjNHR00gT4bSJbd',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (e) {
      print('Exception ${e.toString()}');
    }
  }
}
