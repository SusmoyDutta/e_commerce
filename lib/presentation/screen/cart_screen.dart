import 'package:e_commerce/presentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce/presentation/state_holders/main_button_nav_bar_controller.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/card_product_list.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CartListController>().getCartList();
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
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainButtonNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: GetBuilder<CartListController>(
          builder: (cartListController) {
            if (cartListController.inProgress) {
              return const CenterCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartListController.cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CardProductList(
                            cardProductItem:cartListController.cartList[index],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                _buildCardPriceCheckout(cartListController.totalPrice),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCardPriceCheckout(double totalPrice) {
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
            _buildTotalPrice(totalPrice),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPrice(double price) {
    return  Column(
      children: [
        const Text(
          'Total Price',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        Text(
          "\$ $price",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColorsPath.primaryColors,
          ),
        ),
      ],
    );
  }
}
