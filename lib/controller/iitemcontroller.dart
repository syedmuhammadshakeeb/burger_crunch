import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemData extends GetxController {
  RxList items = [
    {
      'image': 'assets/images/burger1.png',
      'name': 'Double Beef...',
      'rating': '4.2',
      'price': 4.50,
      'color': [
        const Color(0xffEFC741),
        const Color(0xffE85807).withOpacity(0.70),
      ],
      'isfav': false,
      'counter': 1,
      'category': 'Burgers'
    },
    {
      'image': 'assets/images/frice1.png',
      'name': 'Fried Wings',
      'rating': '4',
      'price': 8.00,
      'color': [
        const Color(0xff242424),
        const Color(0xff242424),
        const Color(0xff8A8A8A),
      ],
      'isfav': false,
      'counter': 1,
      'category': 'Fried Chicken'
    },
    {
      'image': 'assets/images/frice2.png',
      'name': 'Animal Fries',
      'rating': '4.5',
      'price': 3.45,
      'color': [
        const Color(0xffEFC741),
        const Color(0xffE85807).withOpacity(0.70),
      ],
      'isfav': false,
      'counter': 1,
      'category': 'Fries'
    },
    {
      'image': 'assets/images/burger.png',
      'name': 'Double Chapli...',
      'rating': '2.9',
      'price': 10.5,
      'color': [
        const Color(0xff242424),
        const Color(0xff242424),
        const Color(0xff8A8A8A),
      ],
      'isfav': false,
      'counter': 1,
      'category': 'Burgers'
    },
    {
      'image': 'assets/images/frice1.png',
      'name': 'Fried Wings',
      'rating': '3.4',
      'price': 4.00,
      'color': [
        const Color(0xffEFC741),
        const Color(0xffE85807).withOpacity(0.70),
      ],
      'isfav': false,
      'counter': 1,
      'category': 'Fried'
    },
    {
      'image': 'assets/images/burger.png',
      'name': 'Single Beef...',
      'rating': '5',
      'price': 5.56,
      'color': [
        const Color(0xff242424),
        const Color(0xff242424),
        const Color(0xff8A8A8A),
      ],
      'isfav': false,
      'counter': 1,
      'category': 'Burgers'
    },
  ].obs;

  //  favourate list
  RxList favourateList = [].obs;
  // add to cart list
  RxList addToCart = [].obs;
}
