import 'package:burger_crunch/res/components/chip.dart';
import 'package:burger_crunch/res/components/container2.dart';
import 'package:burger_crunch/res/components/conteiner3.dart';
import 'package:burger_crunch/res/components/customcontainer1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/nv1.png'),
              Image.asset('assets/images/nv2.png'),
              Image.asset('assets/images/nv3.png'),
              Image.asset('assets/images/nv4.png'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff3B3B3B),
              Color(0xff0A0A0A),
              Color(0xff3B3B3B),
            ], end: Alignment.bottomRight, begin: Alignment.topLeft),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                title: Text(
                  'Hello!',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
                ),
                subtitle: Text(
                  'Sana Khan',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
                ),
                trailing: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 20,
                    width: 20,
                    child: const Stack(
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/icons/bell_icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.amber,
                            child: Center(
                                child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/search_icon.png',
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/menu.png',
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Color(0xff242424))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Color(0xff242424))),
                    fillColor: Colors.grey.shade800,
                    filled: true,
                  ),
                ),
              ),
              Container(
                height: 155,
                width: double.infinity,
                color: Colors.transparent,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomContainer1(),
                      CustomContainer1(),
                      CustomContainer1(),
                      CustomContainer1()
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      ChipWidget(
                        text: 'All',
                        colors: isSelected
                            ? const Color(0xffD9D9D9)
                            : Colors.transparent,
                        ontap: () {},
                        textcolor: const Color(0xffD9D9D9),
                      ),
                      ChipWidget(
                        text: 'Burgers',
                        colors: const Color(0xffD9D9D9),
                        ontap: () {},
                        textcolor: Colors.black,
                      ),
                      ChipWidget(
                        text: 'Fried Chicken',
                        colors: isSelected
                            ? const Color(0xffD9D9D9)
                            : Colors.transparent,
                        ontap: () {},
                        textcolor: const Color(0xffD9D9D9),
                      ),
                      ChipWidget(
                        text: 'Fries',
                        colors: isSelected
                            ? const Color(0xffD9D9D9)
                            : Colors.transparent,
                        ontap: () {},
                        textcolor: const Color(0xffD9D9D9),
                      ),
                      ChipWidget(
                        text: 'Broast',
                        colors: isSelected
                            ? const Color(0xffD9D9D9)
                            : Colors.transparent,
                        ontap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        textcolor: const Color(0xffD9D9D9),
                      ),
                      ChipWidget(
                        text: 'Tikka',
                        colors: isSelected
                            ? const Color(0xffD9D9D9)
                            : Colors.transparent,
                        ontap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        textcolor: const Color(0xffD9D9D9),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Container2(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xffEFC741),
                              const Color(0xffE85807).withOpacity(0.70),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      const Container2(
                        gradient: LinearGradient(
                            colors: [Color(0xff1F1F1F), Color(0xff1F1F1F)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      Container2(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xffEFC741),
                              const Color(0xffE85807).withOpacity(0.70),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Super Meals',
                      style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container3(
                text1: '4.8 rating',
                text: 'The Great Stacker Deal',
                image: const AssetImage('assets/images/bigimage1.png'),
              ),
              Container3(
                  text1: '5.0 rating',
                  text: 'Chapli Fans Offer',
                  image: const AssetImage('assets/images/bigimage2.png')),
            ],
          ),
        ),
      ),
    );
  }
}
