class Urls {
  static const String _baseUls = 'http://ecom-api.teamrabbil.com/api';
  static const String homeSlider = '$_baseUls/ListProductSlider';
  static const String allCategory = '$_baseUls/CategoryList';

  static String productByCategory(int categoryId) =>
      '$_baseUls/ListProductByCategory/$categoryId';

  static String productByRemark(String remark) =>
      '$_baseUls/ListProductByRemark/$remark';

  static String productDetails(int productId) =>
      '$_baseUls/ProductDetailsById/$productId';
  static const String addToCard = '$_baseUls/CreateCartList';

  static String userLoginEmailVerification(String email) =>
      '$_baseUls/UserLogin/$email';

  static String userLoginOtpVerification(String email, String? otp) =>
      '$_baseUls/VerifyLogin/$email/$otp';
  static const String createReadProfile = '$_baseUls/ReadProfile';
  static const String completeCreateProfile = '$_baseUls/CreateProfile';
  static const String productCreateReview = '$_baseUls/CreateProductReview';
  static String reviewByProduct(int? productId) =>
      '$_baseUls/ListReviewByProduct/$productId';
  static String createWish(int? productId) =>
      '$_baseUls/CreateWishList/$productId';
  static const String productWishList = '$_baseUls/ProductWishList';
  static const String cartList = '$_baseUls/CartList';
  static String deleteCartList(int? cartId) =>
      '$_baseUls/DeleteCartList/$cartId';
}
