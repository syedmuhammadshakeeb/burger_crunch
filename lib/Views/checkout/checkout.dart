import 'dart:ui';

import 'package:burger_crunch/controller/iitemcontroller.dart';
import 'package:burger_crunch/controller/payment_stripe_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView({
    super.key,
  });

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final controller = Get.put(ItemData());
  final stripeController = Get.put(stripepayment());
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset('assets/icons/back_arrow.png'),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.paytoneOne(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Line.png',
                      width: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      'Delivery Address',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Text(
                      '4517 Washington Ave. Manchester, Kentucky....',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/map.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Text(
                      'Your Delivery Details',
                      style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      ' Name: Sana Khan',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Phone no.: +92 310-1301446',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Items',
                      style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      itemCount: controller.addToCart.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white),
                                    color: Colors.white.withOpacity(0.1)),
                                child: ListTile(
                                  leading: Image.asset(
                                    controller.addToCart[index]['image'],
                                    height: 42,
                                    width: 44,
                                  ),
                                  title: Text(
                                    controller.addToCart[index]['name'],
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  trailing: Text(
                                    '\$${controller.addToCart[index]['price'].toString()}',
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xffEEBA0B),
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await stripeController.makePayment();
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: const Border(
                                top: BorderSide(
                                  color: Colors.white,
                                ),
                                right: BorderSide(color: Colors.white)),
                            color: const Color(0xffE85807)),
                        child: Center(
                          child: Text(
                            'Pay Order',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
