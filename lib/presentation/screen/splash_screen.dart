import 'package:e_commerce/presentation/screen/main_button_nav_bar_screen.dart';
import 'package:e_commerce/presentation/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getSplashScreenToNav();
  }

  Future<void> getSplashScreenToNav() async {
    await Future.delayed(const Duration(seconds: 1));
      Get.off(() => const MainButtonNavBarScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text('versions 1.0.0'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
