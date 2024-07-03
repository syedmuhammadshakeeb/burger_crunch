import 'package:burger_crunch/Views/splash_view/splash_view.dart';
import 'package:burger_crunch/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey =
      'pk_test_51PW1OkE4L5MMA5zjvzVQ3QfCPvfxLpkbFLVC8laISJmck2BBy9ESeHfdT9sXyYbZxAyKgPUJUThxpoiTYYEaYrPB00N4kwRJVu';
  Stripe.merchantIdentifier = 'shakeeb_stripe';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const SplashView(),
    );
  }
}
