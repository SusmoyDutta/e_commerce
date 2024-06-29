import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/card_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';
//1. work a controller
//2.pstRequest urls and body cardModels tojson kore pathate hobe.
class AddToCardController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> addToCard(CardModel cardModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.addToCard,
      body: cardModel.toJson(),
    );
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
