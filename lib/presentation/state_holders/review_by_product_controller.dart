import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/review_by_product_data.dart';
import 'package:e_commerce/data/models/review_by_product_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ReviewByProductController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<ReviewByProductData> _review = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<ReviewByProductData> get review => _review;

  Future<bool> getReviewByProduct(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    try {
      NetworkResponse response =
          await NetworkCaller.getRequest(url: Urls.reviewByProduct(productId));
      if (response.isSuccess) {
          _review = ReviewByProductModel.fromJson(response.responseData).data??[];
          isSuccess = true;
      } else {
        _errorMessage = response.errorMessage ?? '';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
