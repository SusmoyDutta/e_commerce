import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product_details_model.dart';
import 'package:e_commerce/data/models/product_details_wrapper_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  String _productDetailsErrorMessage = '';
 ProductDetailsModel _productDetailsModel = ProductDetailsModel();
  bool get inProgress => _inProgress;
  String get productDetailsErrorMessage => _productDetailsErrorMessage;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;
  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.productDetails(productId));
    if(response.isSuccess){
      _productDetailsModel = ProductDetailsWrapperModel.fromJson(response.responseData).productData!.first;
    }else{
      _productDetailsErrorMessage = response.errorMessage ?? '';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}