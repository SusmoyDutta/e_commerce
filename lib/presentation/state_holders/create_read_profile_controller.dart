import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/read_profile_data.dart';
import 'package:e_commerce/data/models/read_profile_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CreateReadProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
 late ReadProfileData  _profileData;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  ReadProfileData get profileData => _profileData;

  Future<bool> getReadProfile() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.createReadProfile,
    );
    if (response.isSuccess) {
        _profileData = ReadProfileModel.fromJson(response.responseData).data!;
        isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? '';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
