import 'package:burger_crunch/Views/login_view/login_view.dart';
import 'package:burger_crunch/res/components/custom_navbar.dart';
import 'package:burger_crunch/res/components/profile_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final auth = FirebaseAuth.instance;
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'Profile',
                            style: GoogleFonts.paytoneOne(
                                textStyle: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        trailing: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset('assets/icons/setting_icon.png'),
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/profile.png'),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        'Sana Khan',
                        style: GoogleFonts.paytoneOne(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        'Sana.Khan@example.com',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileContainer(
                        name: 'Edit profile',
                        icon: Icons.edit,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileContainer(
                        name: 'Addresses',
                        icon: Icons.location_city_outlined,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileContainer(
                        name: 'History',
                        icon: Icons.history,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileContainer(
                        name: 'About',
                        icon: Icons.add_box_outlined,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileContainer(
                        name: 'Change password',
                        icon: Icons.lock_clock_outlined,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await auth.signOut().then((value) {
                            Get.to(LoginView());
                          });
                        },
                        child: ProfileContainer(
                          name: 'Log out',
                          icon: Icons.logout_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
