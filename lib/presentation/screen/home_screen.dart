import 'package:e_commerce/data/models/category.dart';
import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/data/models/product_details_model.dart';
import 'package:e_commerce/presentation/screen/auth/complete_profile_screen.dart';
import 'package:e_commerce/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce/presentation/state_holders/main_button_nav_bar_controller.dart';
import 'package:e_commerce/presentation/state_holders/new_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/popular_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/state_holders/special_product_by_remark_controller.dart';
import 'package:e_commerce/presentation/utils/assets_path.dart';
import 'package:e_commerce/presentation/widget/app_actions_icon.dart';
import 'package:e_commerce/presentation/widget/category_item.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/product_card.dart';
import 'package:e_commerce/presentation/widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widget/home_carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const SizedBox(
                    height: 200.0,
                    child: CenterCircularProgressIndicator(),
                  );
                }
                return HomeCarouselSlider(
                  sliderList: sliderController.sliderList,
                );
              }),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainButtonNavBarController>().selectCategories();
                },
              ),
              const SizedBox(height: 10),
              GetBuilder<CategoryListController>(
                builder: (categoryListController) {
                  if (categoryListController.inProgress) {
                    return const SizedBox(
                      height: 120,
                      child: CenterCircularProgressIndicator(),
                    );
                  }
                  return _buildCardListItem(
                      categoryListController.categoryList);
                },
              ),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              GetBuilder<PopularProductByRemarkController>(
                builder: (popularProductByRemarkController) {
                  if (popularProductByRemarkController
                      .popularProductInProgress) {
                    return const SizedBox(
                      height: 220,
                      child: CenterCircularProgressIndicator(),
                    );
                  }
                  return _buildProductListItem(
                    popularProductByRemarkController.popularProduct,
                  );
                },
              ),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              GetBuilder<SpecialProductByRemarkController>(
                builder: (specialProductByRemarkController) {
                  if (specialProductByRemarkController
                      .specialProductInProgress) {
                    return const SizedBox(
                      height: 220,
                      child: CenterCircularProgressIndicator(),
                    );
                  }
                  return _buildProductListItem(
                    specialProductByRemarkController.specialProduct,
                  );
                },
              ),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'New',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              GetBuilder<NewProductByRemarkController>(
                builder: (newProductByRemarkController) {
                  if (newProductByRemarkController.newProductInProgress) {
                    return const SizedBox(
                      height: 220,
                      child: CenterCircularProgressIndicator(),
                    );
                  }
                  return _buildProductListItem(
                    newProductByRemarkController.newProduct,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardListItem(List<Category> categoryList) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(
            category: categoryList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget _buildProductListItem(List<Product> productList) {
    // return SizedBox(
    //   height: 220,
    //   child: ListView.separated(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: productList.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ProductCard(
    //         product: productList[index],
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) {
    //       return const SizedBox(
    //         width: 16,
    //       );
    //     },
    //   ),
    // );
    //Responsive
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productList.map((e) => ProductCard(product: e)).toList(),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
    );
  }
ProductDetailsModel product = ProductDetailsModel();
  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsPath.logoNavImageUrl,
      ),
      actions: [
        const SizedBox(width: 8),
        AppActionsIcon(
          icon: Icons.person,
          onTab: () {
            Get.to(()=>const CompleteProfileScreen());
          },
        ),
        const SizedBox(width: 8),
        AppActionsIcon(
          icon: Icons.call,
          onTab: () {},
        ),
        const SizedBox(width: 8),
        AppActionsIcon(
          icon: Icons.notifications_active_outlined,
          onTab: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
