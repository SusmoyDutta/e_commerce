import 'package:e_commerce/data/models/card_model.dart';
import 'package:e_commerce/data/models/product_details_model.dart';
import 'package:e_commerce/presentation/screen/reviews_screen.dart';
import 'package:e_commerce/presentation/state_holders/add_to_card_controller.dart';
import 'package:e_commerce/presentation/state_holders/add_to_create_wish_controller.dart';
import 'package:e_commerce/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/wish_button.dart';
import 'package:e_commerce/presentation/widget/product_image_carousel_slider_screen.dart';
import 'package:e_commerce/presentation/widget/size_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValues = 1;
  String? _selectedColour;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
          if (productDetailsController.inProgress) {
            return const CenterCircularProgressIndicator();
          }
          ProductDetailsModel productDetails =
              productDetailsController.productDetailsModel;
          List<String> colours = productDetails.color?.split(',') ?? [];
          List<String> size = productDetails.size?.split(',') ?? [];
          _selectedColour = colours.first;
          _selectedSize = size.first;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageCarouselSliderScreen(
                image: [
                  productDetails.img1 ?? '',
                  productDetails.img2 ?? '',
                  productDetails.img3 ?? '',
                  productDetails.img4 ?? '',
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            productDetails.product?.title ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ),
                        _buildCardCounter(),
                      ],
                    ),
                    buildReviews(productDetails),
                    const Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // ColorsPickerScreen(
                    //   // colors: const [
                    //   //   Colors.black,
                    //   //   AppColorsPath.primaryColors,
                    //   //   Colors.brown,
                    //   //   Colors.red,
                    //   //   Colors.grey,
                    //   //   Colors.white24,
                    //   // ],
                    //   onChange: (Color selectedColor) {},
                    // ),
                    SizePickerScreen(
                        size: colours,
                        isRounded: false,
                        onChange: (String s) {
                          _selectedColour = s;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizePickerScreen(
                      size: size,
                      onChange: (String s) {
                        _selectedSize = s;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      productDetails.product?.shortDes ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      productDetails.des ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              _buildCardPrice(productDetails),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildCardPrice(ProductDetailsModel productDetails) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: AppColorsPath.primaryColors.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTotalPrice(productDetails),
            SizedBox(
              width: 100,
              child: GetBuilder<AddToCardController>(
                  builder: (addToCardController) {
                return ElevatedButton(
                  onPressed: () {
                    CardModel cardModel = CardModel(
                        productId: widget.productId,
                        color: _selectedColour,
                        size: _selectedSize,
                        qty: _counterValues);
                    addToCardController.addToCard(cardModel);
                  },
                  child: const Text('Add To Card'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPrice(ProductDetailsModel productDetails) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        Text(
          "\$ ${productDetails.product?.price ?? 0}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColorsPath.primaryColors,
          ),
        ),
      ],
    );
  }

  Widget buildReviews(ProductDetailsModel productDetails) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text(
              "${productDetails.product?.star ?? 0}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => ReviewsScreen(
                  productId: productDetails.product?.id ?? 0,
                ));
          },
          child: const Text('Reviews'),
        ),
        GetBuilder<AddToCreateWishController>(
            builder: (addToCreateWishController) {
          if (addToCreateWishController.inProgress) {
            return Transform.scale(//eta used kora hoy smail indicator de kha nor jono
              scale: 0.4,
              child: const CenterCircularProgressIndicator(),
            );
          }
          return WishButton(
            showProductIcon: true,
            onTap: () {
              addToCreateWishController.addToCreateWish(widget.productId);
            },
          );
        }),
      ],
    );
  }

  Widget _buildCardCounter() {
    return ItemCount(
      color: AppColorsPath.primaryColors,
      initialValue: _counterValues,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      minValue: 1,
      maxValue: 10,
      decimalPlaces: 0,
      onChanged: (value) {
        // print('Selected value: $value');
        _counterValues = value as int;
        setState(() {});
      },
    );
  }
}
