import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/data/models/product_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class NewProductByRemarkController extends GetxController{
  bool _newProductInProgress = false;
  String _newProductError = '';
  List<Product> _newProduct = [];
  bool get newProductInProgress => _newProductInProgress;
  String get newProductError => _newProductError;
  List<Product> get newProduct => _newProduct;
  Future<bool> getNewProduct() async{
    bool isSuccess = false;
    _newProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.productByRemark('New'));
    if(response.isSuccess) {
      _newProduct = ProductListModel
          .fromJson(response.responseData)
          .productList ?? [];
    }else{
      _newProductError = response.errorMessage ?? '';
    }
    _newProductInProgress = false;
    update();
    return isSuccess;
  }
}