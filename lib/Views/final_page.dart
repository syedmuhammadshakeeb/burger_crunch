import 'package:burger_crunch/res/components/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
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
                  child: Image.asset('assets/icons/home.png'),
                ),
              ),
              trailing: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset('assets/icons/question.png'),
              ),
            ),
            Image.asset('assets/images/Line.png'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'ThankYou for placing the order!',
                style: GoogleFonts.paytoneOne(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/sp.png',
              height: 120,
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Estimated delivery time',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
            ),
            Text(
              '20-30 mins',
              style: GoogleFonts.paytoneOne(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: Text(
                'Order Details',
                style: GoogleFonts.paytoneOne(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            ListTile(
              leading: Text(
                'Order ID:',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
              trailing: Text(
                '22134567',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            ListTile(
              leading: Text(
                'Total Item:',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
              trailing: Text(
                '(2)',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            ListTile(
              leading: Text(
                'Total Bill:',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
              trailing: Text(
                '\$13.3',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            ListTile(
              leading: Text(
                'Delivery Fee:',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
              trailing: Text(
                '\$0.00',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
