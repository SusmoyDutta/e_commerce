import 'package:e_commerce/controller_binder.dart';
import 'package:e_commerce/presentation/screen/splash_screen.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // GlobalNavigator key generate
      navigatorKey: CraftyBay.navigatorKey,
      //note this ControllerBinder us in
      initialBinding: ControllerBinder(),

      theme: _buildThemeData(),
      home: const SplashScreen(),

    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColorsPath.primaryColors,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      colorSchemeSeed: AppColorsPath.primaryColors,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsPath.primaryColors,
      ),
      textTheme: _textStyle(),
      inputDecorationTheme: _inputDecorationTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: AppColorsPath.primaryColors,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  TextTheme _textStyle() => const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      );

  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        border: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        disabledBorder: _outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: _outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );

  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColorsPath.primaryColors,
    ),
  );
}
