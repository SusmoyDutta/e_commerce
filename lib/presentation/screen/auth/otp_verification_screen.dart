import 'dart:async';
import 'package:e_commerce/presentation/screen/auth/complete_profile_screen.dart';
import 'package:e_commerce/presentation/screen/main_button_nav_bar_screen.dart';
import 'package:e_commerce/presentation/state_holders/create_read_profile_controller.dart';
import 'package:e_commerce/presentation/state_holders/verify_email_controller.dart';
import 'package:e_commerce/presentation/state_holders/verify_otp_controller.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/app_logo.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/snake_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int _counter = 120;
  late Timer _time;
  final VerifyOtpController verifyOtpController = VerifyOtpController();
  final CreateReadProfileController createReadProfileController =
      CreateReadProfileController();
  final VerifyEmailController verifyEmailController = VerifyEmailController();

  // final Product product = Product();

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    _counter = 120;
    _time = Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          _time.cancel();
        }
      },
    );
  }

  void resendCode() {
    setState(() {
      _time.cancel();
      _counter = 120;
      countDown();
    });
  verifyEmailController.verifyEmail(widget.email) ;
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const AppLogo(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter Otp Code',
                style: textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'A 4 Digit OTP Code has been sent',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 14,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: AppColorsPath.primaryColors,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: _otoTEController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<VerifyOtpController>(builder: (verifyOtpController) {
                if (verifyOtpController.inProgress) {
                  return const CenterCircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                       _otoTEController.text.trim();
                      bool isVerified = await verifyOtpController
                          .verifyEmailOtp(widget.email,  _otoTEController.text);
                      if (isVerified) {
                        await createReadProfileController.getReadProfile();
                        if (createReadProfileController.profileData.userId!=null) {
                          await Get.to(() => const CompleteProfileScreen());
                          const ShowSnakeBarMessage(title: ' is Success');
                        } else {
                          Get.off(() => const MainButtonNavBarScreen());
                        }
                      } else {
                        ShowSnakeBarMessage(
                            title: verifyOtpController.errorMessage);
                        setState(() {
                          _otoTEController.clear();
                        });
                      }
                    }
                  }, //hoardbazaarsin@gmail.com
                  child: const Text('Next'),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                  text: 'This code will be expire in ',
                  style: textTheme.headlineSmall,
                  children: [
                    TextSpan(
                      text: "$_counter s",
                      style: textTheme.headlineSmall?.copyWith(
                        color: AppColorsPath.primaryColors,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: _counter == 0 ? resendCode : null,
                child: Text(
                  'Resend Code',
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }
}
