import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/data/models/product_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class SpecialProductByRemarkController extends GetxController{
  bool _specialProductInProgress = false;
  String _specialProductErrorMessage = '';
  List<Product> _specialProduct = [];
  bool get specialProductInProgress => _specialProductInProgress;
  String get specialProductErrorMessage => _specialProductErrorMessage;
  List<Product> get specialProduct => _specialProduct;
  Future<bool> getSpecialProduct() async {
    bool isSuccess = false;
    _specialProductInProgress = true;
    update();
   final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.productByRemark('Special'));
    if(response.isSuccess){
      _specialProduct = ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }else{
      _specialProductErrorMessage = response.errorMessage ?? '';
    }
    _specialProductInProgress = false;
    update();
    return isSuccess;
  }
}