import 'package:e_commerce/presentation/screen/auth/otp_verification_screen.dart';
import 'package:e_commerce/presentation/state_holders/verify_email_controller.dart';
import 'package:e_commerce/presentation/widget/app_logo.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/regexp_email_verification.dart';
import 'package:e_commerce/presentation/widget/snake_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
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
                  'Welcome Back',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please Enter your Email Address',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _emailTEController,
                  validator: (String? values) {
                    if (values?.isEmpty ?? true) {
                      return 'Enter your Email Adders';
                    }
                    if (Constants.regExpEmailVerification
                            .hasMatch(values ?? '') ==
                        false) {
                      return 'Enter your valid Email Adders';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<VerifyEmailController>(
                    builder: (verifyEmailController) {
                  if (verifyEmailController.inProgress) {
                    return const CenterCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        verifyEmailController
                            .verifyEmail(_emailTEController.text.trim())
                            .then((result) {
                          if (result == true) {
                            Get.to(
                              () => OtpVerificationScreen(
                                email: _emailTEController.text,
                              ),
                            );
                            const ShowSnakeBarMessage(title: 'Email is Send');
                          } else {
                            const ShowSnakeBarMessage(
                              title: ' Email verification failed',
                            );
                          }
                        });
                      }
                    },
                    child: const Text('Next'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
