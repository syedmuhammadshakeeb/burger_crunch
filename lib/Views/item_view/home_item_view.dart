import 'dart:ui';

import 'package:burger_crunch/controller/iitemcontroller.dart';
import 'package:burger_crunch/res/components/container2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeItemView extends StatefulWidget {
  final image;
  String tag;
  bool? fav;
  String name, price;
  VoidCallback ontap;

  HomeItemView(
      {super.key,
      required this.image,
      required this.tag,
      this.fav,
      required this.name,
      required this.price,
      required this.ontap});

  @override
  State<HomeItemView> createState() => _HomeItemViewState();
}

class _HomeItemViewState extends State<HomeItemView> {
  final controller = Get.put(ItemData());
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff3B3B3B),
              Color(0xff0A0A0A),
              Color(0xff3B3B3B),
            ], end: Alignment.bottomRight, begin: Alignment.topLeft),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
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
                      trailing: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: widget.fav == true
                                ? const Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                  ),
                          )),
                    ),
                    Hero(
                      tag: widget.tag,
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        '\$${widget.price}',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 1,
                            itemSize: 20,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xffE85807),
                              size: 19,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/time.png',
                                height: 15,
                                width: 15,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Delivery in 30 min',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        '100+ reviews',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child:
                          Center(child: Image.asset('assets/images/Line.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Description',
                        style: GoogleFonts.paytoneOne(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur lorem orci Condimentum vitae risus lorem orci.',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child:
                          Center(child: Image.asset('assets/images/Line.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Related Product',
                        style: GoogleFonts.paytoneOne(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Column(
                        children: [
                          GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: controller.items.length,
                              padding: const EdgeInsets.only(right: 15),
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: double.maxFinite,
                                  child: Container2(
                                    gradient: const [
                                      Color(0xff242424),
                                      Color(0xff242424),
                                      Color(0xff8A8A8A),
                                    ],
                                    favourite: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.black,
                                      size: 16.61,
                                    ),
                                    image: controller.items[index]['image'],
                                    text: controller.items[index]['name'],
                                    price: controller.items[index]['price']
                                        .toString(),
                                    rating: controller.items[index]['rating'],
                                  ),
                                );
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 74,
                                decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (counter >= 1) {
                                            setState(() {
                                              counter--;
                                            });
                                          } else {
                                            setState(() {
                                              counter = 0;
                                            });
                                          }
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 13,
                                            )),
                                      ),
                                      Text(counter.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            counter++;
                                          });
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(100),
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
                              GestureDetector(
                                onTap: widget.ontap,
                                child: Container(
                                  height: 30,
                                  width: 107,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE85807),
                                      borderRadius: BorderRadius.circular(30),
                                      border: const Border(
                                          bottom:
                                              BorderSide(color: Colors.white),
                                          right:
                                              BorderSide(color: Colors.white))),
                                  child: Center(
                                    child: Text(
                                      'Add to Cart',
                                      style: GoogleFonts.rosario(
                                          textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
