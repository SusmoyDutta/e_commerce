import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/cart_list_data.dart';
import 'package:e_commerce/data/models/cart_list_models.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CartListData> _cartList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CartListData> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.cartList);
    if (response.isSuccess) {
      _cartList = CartListModels.fromJson(response.responseData).data ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? '';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartListData cartItem in _cartList) {
      total +=
          (cartItem.qty ?? 1) * (double.tryParse(cartItem.price ?? '0') ?? 0);
    }
    return total;
  }
  void changeProductQuantity(int cartId,int quantity){
    _cartList.firstWhere((c)=>c.id == cartId).qty == quantity;
  }
  //DeleteProduct
  void _deleteProductItem(int cartId){
    _cartList.removeWhere((c)=>c.id == cartId);
  }
  Future<bool> deleteProductCartItem(int cartId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(url: Urls.deleteCartList(cartId));
    if(response.isSuccess){
      _deleteProductItem(cartId);
    }else{
      _errorMessage = response.errorMessage ?? '';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
