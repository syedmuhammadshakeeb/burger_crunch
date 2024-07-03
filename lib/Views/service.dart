import 'package:burger_crunch/Views/home_view/home_view.dart';
import 'package:burger_crunch/Views/login_view/login_view.dart';
import 'package:burger_crunch/res/components/custom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class routeService {
  final auth = FirebaseAuth.instance;
  userServices() {
    String? user = auth.currentUser?.phoneNumber;
    if (user?.isNotEmpty ?? false) {
      Get.to(const CustomNavBar());
    } else {
      Get.to(const LoginView());
    }
  }
}
