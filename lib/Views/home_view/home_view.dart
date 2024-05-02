import 'package:burger_crunch/res/components/customcontainer1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      borderSide: BorderSide(color: Color(0xff242424))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xff242424))),
                  fillColor: Colors.grey.shade800,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 155,
                width: double.infinity,
                color: Colors.transparent,
                child: const SingleChildScrollView(
                  padding: EdgeInsets.all(0),
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
            )
          ],
        ),
      ),
    );
  }
}
