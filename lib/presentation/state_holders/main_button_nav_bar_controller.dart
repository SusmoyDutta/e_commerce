import 'package:e_commerce/presentation/screen/auth/email_verification_screen.dart';
import 'package:e_commerce/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';
//note this getXController get selectedIndex us in
class MainButtonNavBarController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Future<void> changeIndex(int index) async {
    if(index == 2 || index == 3) {
     final isLogin = await UserAuthController.checkLoginState();
     if(!isLogin){
       Get.to(()=>const EmailVerificationScreen(),);
       return;
     }
    }
    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }

  void selectCategories() {
    changeIndex(1);
  }
}