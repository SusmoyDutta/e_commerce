import 'package:e_commerce/presentation/state_holders/main_button_nav_bar_controller.dart';
import 'package:e_commerce/presentation/state_holders/product_wish_list_controller.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductWishListController>().getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find()<MainButtonNavBarController>();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainButtonNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: GetBuilder<ProductWishListController>(
            builder: (productWishListController) {
          if (productWishListController.inProgress) {
            return const CenterCircularProgressIndicator();
          }
          return RefreshIndicator(
            onRefresh: () async {
              productWishListController.getWishList();
            },
            child: GridView.builder(
              itemCount: productWishListController.wishList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return FittedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: ProductCard(
                      showProductIcon: false,
                      product:
                          productWishListController.wishList[index].product!,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
