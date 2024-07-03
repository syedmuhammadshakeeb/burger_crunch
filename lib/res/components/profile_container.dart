import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatefulWidget {
  String name;
  final icon;
  ProfileContainer({super.key, required this.icon, required this.name});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xff3B3B3B),
              const Color(0xff3B3B3B).withOpacity(0.5),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.name,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              ),
              Image.asset(
                'assets/icons/back_arrow.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
