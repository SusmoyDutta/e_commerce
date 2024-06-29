import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyEmailOtp(String email, String? otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.userLoginOtpVerification(email, otp),
      fromAuth: true,
    );

    if (response.isSuccess && response.responseData['msg'] == 'success') {
      isSuccess = true;
      await UserAuthController.saveUserToken(response.responseData['data']);
    } else {
      _errorMessage = errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
