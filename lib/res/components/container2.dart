import 'package:burger_crunch/controller/iitemcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Container2 extends StatefulWidget {
  final gradient;
  final favourite;
  final image;
  String text;
  String rating;
  String price;

  Container2({
    super.key,
    required this.gradient,
    required this.favourite,
    required this.image,
    required this.text,
    required this.rating,
    required this.price,
  });

  @override
  State<Container2> createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  final controller = Get.put(ItemData());
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
                    gradient: LinearGradient(
                        colors: widget.gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            widget.image,
                            height: 82,
                            width: 115,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.text,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Text(
                              '${widget.rating} rating',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            Text(
                              widget.price.toString(),
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
                        child: widget.favourite,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.0015,
              right: MediaQuery.of(context).size.width * 0,
              child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Color(0xff8A8A8A), Color(0xff242424)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Image.asset('assets/icons/add_icon.png')),
            )
          ],
        ),
      ),
    );
  }
}
