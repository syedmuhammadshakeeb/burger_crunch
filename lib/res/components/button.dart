import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  String text;
  final icon;
  void Function() ontap;
  final colors;
  CustomButton(
      {super.key,
      required this.text,
      this.icon,
      required this.ontap,
      this.colors});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: 50,
        width: 338,
        decoration: BoxDecoration(
          color: widget.colors,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
              size: 27.5,
            ),
            Text(
              widget.text,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton2 extends StatefulWidget {
  String text;
  final image;
  void Function() ontap;
  final colors;
  CustomButton2(
      {super.key,
      required this.text,
      this.image,
      required this.ontap,
      this.colors});

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: 50,
        width: 338,
        decoration: BoxDecoration(
          color: widget.colors,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.image),
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Text(
                widget.text,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
