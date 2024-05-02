import 'package:burger_crunch/res/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                height: 325,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/lg1.png'))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                  child: Image.asset(
                'assets/images/sp.png',
                height: 60,
                width: 78.57,
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Where Every Bite Packs a Punch!',
                style: GoogleFonts.paytoneOne(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IntlPhoneField(
                  flagsButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 10),
                  cursorColor: Colors.white,
                  initialCountryCode: '+92',
                  showDropdownIcon: false,
                  dropdownTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: '|  phone number',
                    hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5)),
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              CustomButton(
                  text: 'Send OTP',
                  colors: const Color(0xffE85807),
                  ontap: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Image.asset('assets/images/or.png'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomButton2(
                  text: 'Continue with Apple',
                  image: 'assets/images/apple.png',
                  colors: Colors.grey.withOpacity(0.5),
                  ontap: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomButton2(
                  text: 'Continue with Google',
                  image: 'assets/images/google.png',
                  colors: Colors.grey.withOpacity(0.5),
                  ontap: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Text('By continuing, you agree to our',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Terms of Service · Privacy Policy · Content Policy',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
              )
            ])),
      ),
    );
  }
}
