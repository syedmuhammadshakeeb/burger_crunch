import 'package:burger_crunch/res/components/custom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatefulWidget {
  String verificationId;
  var number;
  OtpView({super.key, required this.verificationId, required this.number});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final auth = FirebaseAuth.instance;
  var otpController = TextEditingController();
  var otpvalue;
  bool loading = false;
  final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff3B3B3B),
              Color(0xff0A0A0A),
              Color(0xff3B3B3B),
            ], end: Alignment.bottomRight, begin: Alignment.topLeft),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: InkWell(
                  onTap: () {
                    Get.to(const CustomNavBar());
                  },
                  child: Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset('assets/icons/back_arrow.png'),
                  ),
                ),
                title: Text(
                  'OTP Verification',
                  style: GoogleFonts.paytoneOne(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/Line.png'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 110.0),
                child: Text(
                  'Verification Code',
                  style: GoogleFonts.paytoneOne(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Enter the code from the SMS we sent to your mobile number: ${widget.number} ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!
                            .copyWith(border: Border.all(color: Colors.green))),
                    onCompleted: (value) {
                      otpvalue = value;
                      print('--->$otpvalue');
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    final cridential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpvalue);
                    try {
                      await auth.signInWithCredential(cridential);
                      Get.snackbar('Sucessful!', 'Welcome to Home Screen',
                          backgroundColor: Colors.green.withOpacity(0.5));
                      Get.to(const CustomNavBar());
                    } catch (e) {
                      setState(() {
                        loading = false;
                      });
                      Get.snackbar('Request failed!', '${e.toString()}',
                          backgroundColor: Colors.red.withOpacity(0.5));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: const Border(
                            top: BorderSide(
                              color: Colors.white,
                            ),
                            right: BorderSide(color: Colors.white)),
                        color: const Color(0xffE85807)),
                    child: Center(
                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Verify now',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
