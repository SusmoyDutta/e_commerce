import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  Future<bool> verifyEmail(String email) async {
    bool isSuccess =false;
    _inProgress =true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(url: Urls.userLoginEmailVerification(email));
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMessage = errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
