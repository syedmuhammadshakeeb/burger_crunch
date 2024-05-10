import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Container3 extends StatefulWidget {
  String text, text1;
  final image;

  Container3(
      {super.key,
      required this.text,
      required this.text1,
      required this.image});

  @override
  State<Container3> createState() => _Container3State();
}

class _Container3State extends State<Container3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 150,
        width: 357,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: widget.image)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.paytoneOne(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
              ),
              Text(
                widget.text1,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
