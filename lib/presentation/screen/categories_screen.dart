import 'package:e_commerce/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/main_button_nav_bar_controller.dart';
import 'package:e_commerce/presentation/widget/category_item.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainButtonNavBarController>();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainButtonNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        body: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if (categoryListController.inProgress) {
                return const SizedBox(
                  height: 120,
                  child:CenterCircularProgressIndicator(),
                );
              }
              // RefreshIndicator use this.
          return RefreshIndicator(
            onRefresh: ()=> categoryListController.getCategory(),
            child: GridView.builder(
              itemCount: categoryListController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryItem(
                    category: categoryListController.categoryList[index],
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
