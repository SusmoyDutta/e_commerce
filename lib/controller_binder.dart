import 'package:e_commerce/presentation/state_holders/add_to_card_controller.dart';
import 'package:e_commerce/presentation/state_holders/add_to_create_wish_controller.dart';
import 'package:e_commerce/presentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/complete_create_profile_controller.dart';
import 'package:e_commerce/presentation/state_holders/create_product_review_controller.dart';
import 'package:e_commerce/presentation/state_holders/create_read_profile_controller.dart';
import 'package:e_commerce/presentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce/presentation/state_holders/main_button_nav_bar_controller.dart';
import 'package:e_commerce/presentation/state_holders/new_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/product_by_category_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/popular_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce/presentation/state_holders/product_wish_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/review_by_product_controller.dart';
import 'package:e_commerce/presentation/state_holders/special_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/verify_email_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/verify_otp_controller.dart';

//note this ControllerBinder us in get
class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainButtonNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductByCategoryListController());
    Get.put(PopularProductByRemarkController());
    Get.put(SpecialProductByRemarkController());
    Get.put(NewProductByRemarkController());
    Get.put(ProductDetailsController());
    Get.put(AddToCardController());
    Get.put(VerifyEmailController());
    Get.put(VerifyOtpController());
    Get.put(CreateReadProfileController());
    Get.put(CompleteCreateProfileController());
    Get.put(CreateProductReviewController());
    Get.put(ReviewByProductController());
    Get.put(AddToCreateWishController());
    Get.put(ProductWishListController());
    Get.put(CartListController());

  }
}
