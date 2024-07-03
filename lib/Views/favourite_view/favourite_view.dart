import 'package:burger_crunch/controller/iitemcontroller.dart';
import 'package:burger_crunch/res/components/container2.dart';
import 'package:burger_crunch/res/components/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  final controller = Get.put(ItemData());
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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
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
                    'Favourites',
                    style: GoogleFonts.paytoneOne(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  padding: const EdgeInsets.only(right: 20),
                  shrinkWrap: true,
                  itemCount: controller.favourateList.length,
                  itemBuilder: (context, index) {
                    // return Text('favourite added');
                    return Container2(
                        gradient: const [
                          Color(0xff242424),
                          Color(0xff242424),
                          Color(0xff8A8A8A),
                        ],
                        favourite:
                            controller.favourateList[index]['isfav'] == true
                                ? const Icon(
                                    Icons.favorite,
                                    size: 16.61,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 16.61,
                                    color: Colors.black,
                                  ),
                        image: controller.favourateList[index]['image'],
                        text: controller.favourateList[index]['name'],
                        rating: controller.favourateList[index]['rating'],
                        price: controller.favourateList[index]['price']
                            .toString());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
