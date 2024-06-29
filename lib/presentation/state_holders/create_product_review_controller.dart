// import 'dart:developer';
//
// import 'package:e_commerce/data/%20utilits/urls.dart';
// import 'package:e_commerce/data/models/create_reviews_data.dart';
// import 'package:e_commerce/data/models/create_reviews_model.dart';
// import 'package:e_commerce/data/models/network_response.dart';
// import 'package:e_commerce/data/network_caller/network_caller.dart';
// import 'package:e_commerce/presentation/widget/snake_bar_message.dart';
// import 'package:get/get.dart';
//
// class CreateProductReview extends GetxController {
//   bool _inProgress = false;
//   String _errorMessage = '';
//   late bool _Success;
//
//
//   bool get inProgress => _inProgress;
//
//   String get errorMessage => _errorMessage;
//   dynamic get success =>_Success;
//
//   Future<bool> getCreateProductReview() async {
//     bool isSuccess = false;
//     _inProgress = true;
//     update();
//     log(Urls.productCreateReview);
//     NetworkResponse response = await NetworkCaller.postRequest(
//       url: Urls.productCreateReview,
//       body: CreateReviewsModel(
//         msg: 'success',
//         data: CreateReviewsData(),
//       ).toJson(),
//     );
//     if (response.isSuccess) {
//       log(response.isSuccess.toString());
//       log(response.responseCode.toString());
//       log(response.errorMessage.toString());
//       if(response.responseCode != null){}else{
//       _Success =  response.responseData;
//       isSuccess = true;}
//     } else {
//       ShowSnakeBarMessage(
//         title: _errorMessage = response.errorMessage ?? '',
//       );
//     }
//     _inProgress = false;
//     update();
//     return isSuccess;
//   }
// }
import 'dart:developer';

import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/create_reviews_data.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/presentation/widget/snake_bar_message.dart';
import 'package:get/get.dart';

class CreateProductReviewController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  bool _isSuccess = false; // Initialize with a default value

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<bool> getCreateProductReview(CreateReviewsData createReviewsData) async {
    _inProgress = true;
    _isSuccess = false; // Reset success flag
    update();

    log(Urls.productCreateReview);
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.productCreateReview,
      body: createReviewsData.toJson(),
    );

    if (response.isSuccess) {
      log(response.isSuccess.toString());
      log(response.responseCode.toString());
      log(response.errorMessage.toString());
      if (response.responseCode != null) {
        _isSuccess = response.responseData ?? false; // Ensure boolean assignment
      } else {
        _isSuccess = true;
      }
    } else {
      ShowSnakeBarMessage(
        title: _errorMessage = response.errorMessage ?? 'Unknown error',
      );
    }

    _inProgress = false;
    update();
    return _isSuccess;
  }
}
