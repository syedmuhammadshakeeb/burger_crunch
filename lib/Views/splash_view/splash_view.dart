import 'package:burger_crunch/Views/login_view/login_view.dart';
import 'package:burger_crunch/res/components/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff3B3B3B),
        Color(0xff0A0A0A),
        Color(0xff3B3B3B),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: Image.asset(
            'assets/images/sp.png',
            height: 130,
            width: 138,
          )),
          const Spacer(),
          CustomButton(
            text: 'Get Started',
            ontap: () {
              Get.to(const LoginView());
            },
            colors: const Color(0xffE85807),
            icon: Icons.arrow_forward,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
