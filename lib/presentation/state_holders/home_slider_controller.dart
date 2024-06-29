import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/slider_data.dart';
import 'package:e_commerce/data/models/slider_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CategoryList> _sliderList = [];

  bool get inProgress => _inProgress;

  List<CategoryList> get sliderList => _sliderList;

  String get errorMessage => _errorMessage;

  Future<bool> getSlider() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.homeSlider,
    );
    if (response.isSuccess) {
      _sliderList =
          SliderListModel.fromJson(response.responseData).sliderList ?? [];
    } else {
      _errorMessage = response.errorMessage ?? 'Home Slider is Failed';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
