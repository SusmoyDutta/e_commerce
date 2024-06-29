import 'package:e_commerce/presentation/screen/cart_screen.dart';
import 'package:e_commerce/presentation/screen/categories_screen.dart';
import 'package:e_commerce/presentation/screen/home_screen.dart';
import 'package:e_commerce/presentation/screen/wish_screen.dart';
import 'package:e_commerce/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce/presentation/state_holders/main_button_nav_bar_controller.dart';
import 'package:e_commerce/presentation/state_holders/new_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/popular_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/special_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainButtonNavBarScreen extends StatefulWidget {
  const MainButtonNavBarScreen({super.key});

  @override
  State<MainButtonNavBarScreen> createState() => _MainButtonNavBarScreenState();
}

class _MainButtonNavBarScreenState extends State<MainButtonNavBarScreen> {
  final MainButtonNavBarController _navBarController =
      Get.find<MainButtonNavBarController>();
  final List <Widget> _screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishScreen(),
  ];
  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getSlider();
    Get.find<CategoryListController>().getCategory();
    Get.find<PopularProductByRemarkController>().getPopularProduct();
    Get.find<SpecialProductByRemarkController>().getSpecialProduct();
    Get.find<NewProductByRemarkController>().getNewProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainButtonNavBarController>(
        builder: (_) {
          return _screen[_navBarController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainButtonNavBarController>(
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: _navBarController.selectedIndex,
            onTap: _navBarController.changeIndex,
            selectedItemColor: AppColorsPath.primaryColors,
            unselectedItemColor: Colors.black45,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(color: Colors.black,),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet_giftcard),
                label: 'Wish',
              ),
            ],
          );
        }
      ),
    );
  }
}
