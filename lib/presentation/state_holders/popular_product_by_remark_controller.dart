import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/data/models/product_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class PopularProductByRemarkController extends GetxController {
  bool _popularProductInProgress = false;
  List<Product> _popularProduct = [];
  String _popularProductErrorMessage = '';
  bool get popularProductInProgress => _popularProductInProgress;
  String get popularProductErrorMessage => _popularProductErrorMessage;
  List<Product> get popularProduct => _popularProduct;
  Future<bool> getPopularProduct() async {
    bool isSuccess = false;
    _popularProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.productByRemark('Popular'));
    if(response.isSuccess){
    _popularProduct = ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }else{
      _popularProductErrorMessage = response.errorMessage ?? '';
    }
    _popularProductInProgress = false;
    update();
    return isSuccess;
  }
}
