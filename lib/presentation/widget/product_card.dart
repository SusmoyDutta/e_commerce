import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/presentation/screen/product_details_screen.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showProductIcon = true,
    required this.product,
  });

  final bool showProductIcon;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetailsScreen(
            productId: product.id ?? 0,
          ),
        );
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: SizedBox(
          width: 170,
          child: Column(
            children: [
              Container(
                width: 170,
                decoration: BoxDecoration(
                  color: AppColorsPath.primaryColors.withOpacity(0.11),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NetworkCachedImage(
                    url: product.image ?? '',
                    height: 100,
                    colors: AppColorsPath.primaryColors.withOpacity(0.10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildProductDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductName(),
        _buildProductPriceRTFB(),
      ],
    );
  }

  Widget _buildProductName() {
    return Text(
      product.title ?? '',
      maxLines: 2,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildProductPriceRTFB() {
    return Wrap(
      spacing: 12,
      alignment: WrapAlignment.start,
      children: [
        Text(
          '\$ ${product.price ?? 0}',
          style: const TextStyle(
            color: AppColorsPath.primaryColors,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Wrap(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text(
              '${product.star ?? 0}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        // const WishButton(),
      ],
    );
  }

// Widget _buildProductFavorite() {
//   return Visibility(
//     visible: showProductIcon,
//     replacement:_getProductCar(Icons.delete_outline),
//     child: _getProductCar(Icons.favorite_border),
//   );
// }
// Widget _getProductCar(IconData icon){
//   return Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(
//         2,
//       ),
//     ),
//     color: AppColorsPath.primaryColors,
//     child:Icon(
//      icon,
//       size: 16,
//       color: Colors.white,
//     ),
//   );
// }
}
