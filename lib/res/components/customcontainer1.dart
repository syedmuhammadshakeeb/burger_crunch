import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer1 extends StatefulWidget {
  const CustomContainer1({
    super.key,
  });

  @override
  State<CustomContainer1> createState() => _CustomContainer1State();
}

class _CustomContainer1State extends State<CustomContainer1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        height: 160,
        width: 260,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                child: Container(
                  height: 130,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.white,
                      Colors.amber.shade300,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 40,
                          left: 20,
                          child: Image.asset(
                            'assets/images/75%.png',
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'FREE Delivery',
                              style: GoogleFonts.paytoneOne(
                                  textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              )),
                            ),
                            Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: const Color(0xffE85807),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: Text(
                                  'Order Now',
                                  style: GoogleFonts.rosario(
                                      textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -29,
              right: -45,
              child: Image.asset(
                  'assets/images/photo-1632203171982-cc0df6e9ceb4-removebg-preview 1.png'),
            )
          ],
        ),
      ),
    );
  }
}
