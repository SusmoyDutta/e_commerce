import 'package:e_commerce/presentation/state_holders/product_by_category_list_controller.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductByCategoryListController>()
        .getProductList(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
        ),
      ),
      body: GetBuilder<ProductByCategoryListController>(
          builder: (productByCategoryListController) {
        if (productByCategoryListController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        return GridView.builder(
          itemCount: productByCategoryListController.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (BuildContext context, int index) {
            return FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: ProductCard(
                  product: productByCategoryListController.productList[index],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
