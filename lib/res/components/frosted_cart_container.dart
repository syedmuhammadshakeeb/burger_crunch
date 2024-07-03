import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class FrostedCartContainer extends StatefulWidget {
  String name, price;
  final iamge;
  FrostedCartContainer(
      {super.key,
      required this.iamge,
      required this.name,
      required this.price});

  @override
  State<FrostedCartContainer> createState() => _FrostedCartContainerState();
}

class _FrostedCartContainerState extends State<FrostedCartContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 82,
          width: 240,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadiusDirectional.circular(10),
              border: Border.all(color: Colors.white)),
          child: Row(
            children: [
              Image(
                image: AssetImage(
                  widget.iamge,
                ),
                height: 90,
                width: 100,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ),
                  Text(
                    widget.price,
                    style: GoogleFonts.paytoneOne(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
