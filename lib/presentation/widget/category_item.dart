import 'package:e_commerce/data/models/category.dart';
import 'package:e_commerce/presentation/screen/product_list_screen.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductListScreen(
            categoryName: category.categoryName ?? '',
            categoryId: category.id ?? 0,
          ),
        );
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColorsPath.primaryColors.withOpacity(0.11),
                borderRadius: BorderRadius.circular(8),
              ),
              child: NetworkCachedImage(
                url: category.categoryImg ?? '',
                boxFit: BoxFit.cover,
                colors: Colors.transparent,
                height: 40,
                width: 40,
              )),
          const SizedBox(height: 8),
          Text(
            category.categoryName ?? '',
            maxLines: 1,
            style: const TextStyle(
              color: AppColorsPath.primaryColors,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
