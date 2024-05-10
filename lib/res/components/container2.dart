import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Container2 extends StatefulWidget {
  final gradient;
  const Container2({super.key, required this.gradient});

  @override
  State<Container2> createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: Container(
        height: 159,
        width: 178,
        child: Stack(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              animationDuration: Duration(seconds: 2),
              color: const Color(0xffEFC741),
              child: Container(
                height: 160,
                width: 168,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: widget.gradient),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/burger1.png',
                            height: 82,
                            width: 115,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Double Beef P...',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Text(
                              '4.8 rating',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            Text(
                              '8.00',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          size: 16.61,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: const Icon(
                  Icons.add,
                  color: Color(0xffE85D07),
                  size: 23,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
