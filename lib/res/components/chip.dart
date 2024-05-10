import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  VoidCallback ontap;
  String text;
  final colors;
  final textcolor;
  ChipWidget(
      {super.key,
      required this.colors,
      required this.ontap,
      required this.text,
      required this.textcolor});

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.colors,
              border: Border.all(color: const Color(0xffD9D9D9))),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Text(
              widget.text,
              style: TextStyle(color: widget.textcolor, fontSize: 14),
            ),
          )),
        ),
      ),
    );
  }
}
