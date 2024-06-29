import 'dart:developer';
import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/create_profile_data.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CompleteCreateProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getCreateProfile(CreateProfileData createProfile) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.completeCreateProfile,
      body: createProfile.toJson(),
    );
    log(Urls.createReadProfile);
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? '';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
