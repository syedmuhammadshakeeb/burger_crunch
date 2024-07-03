import 'dart:ffi';

import 'package:burger_crunch/Views/checkout/checkout.dart';
import 'package:burger_crunch/controller/iitemcontroller.dart';
import 'package:burger_crunch/res/components/container2.dart';
import 'package:burger_crunch/res/components/custom_navbar.dart';
import 'package:burger_crunch/res/components/frosted_cart_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late double totalAmount;
  var sum = 0.0;
  double itemprice = 0.0;
  additem() {
    for (var i in controller.addToCart) {
      sum = sum + i['price'];
    }
    totalAmount = sum;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    additem();
  }

  final controller = Get.put(ItemData());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Cart screen.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
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
                          child: Image.asset('assets/icons/back_arrow.png'),
                        ),
                      ),
                      title: Center(
                        child: Text(
                          'My Cart',
                          style: GoogleFonts.paytoneOne(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Image.asset(
                      'assets/images/Line.png',
                      width: 270,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 225.0),
                      child: Text(
                        'Items',
                        style: GoogleFonts.paytoneOne(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: controller.addToCart.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FrostedCartContainer(
                                    iamge: controller.addToCart[index]['image'],
                                    name: controller.addToCart[index]['name'],
                                    price: controller.addToCart[index]['price']
                                        .toString(),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 64,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffffffff),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (controller
                                                              .addToCart[index]
                                                          ['counter'] >=
                                                      1) {
                                                    setState(() {
                                                      controller
                                                              .addToCart[index]
                                                          ['counter']--;
                                                      itemprice = controller
                                                                  .addToCart[
                                                              index]['price'] /
                                                          controller.addToCart[
                                                              index]['counter'];
                                                    });
                                                  } else {
                                                    setState(() {
                                                      controller
                                                              .addToCart[index]
                                                          ['counter'] = 1;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: 13,
                                                    )),
                                              ),
                                              Text(
                                                  controller.addToCart[index]
                                                          ['counter']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    controller.addToCart[index]
                                                        ['counter']++;
                                                    itemprice = controller
                                                                .addToCart[
                                                            index]['price'] *
                                                        controller.addToCart[
                                                            index]['counter'];
                                                    print(
                                                        '------->>>$itemprice');
                                                  });
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 13,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            controller.addToCart
                                                .removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 64,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffffffff),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: Icon(
                                                Icons.delete,
                                                color:
                                                    Colors.red.withOpacity(0.8),
                                                size: 18,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff3B3B3B),
                        const Color(0xff3B3B3B).withOpacity(0.5),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total items (${controller.addToCart.length})',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              'USD  ${totalAmount + itemprice}',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Fee',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              'USD  00.0',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        Center(
                            child: Image.asset(
                          'assets/images/Line.png',
                          color: Color(0xff606060),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffEEBA0B),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              'USD  ${totalAmount + itemprice}',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffEEBA0B),
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(CheckoutView());
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xffE85807),
                                border: const Border(
                                    bottom: BorderSide(color: Colors.white),
                                    right: BorderSide(color: Colors.white)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                'Check Out',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
