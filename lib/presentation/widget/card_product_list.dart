import 'package:e_commerce/data/models/cart_list_data.dart';
import 'package:e_commerce/presentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CardProductList extends StatefulWidget {
  const CardProductList({super.key, required this.cardProductItem});

  final CartListData cardProductItem;

  @override
  State<CardProductList> createState() => _CardProductListState();
}

class _CardProductListState extends State<CardProductList> {
  late int _counterListItem;

  @override
  void initState() {
    super.initState();
    _counterListItem = widget.cardProductItem.qty ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _buildCardProductImage(),
          _buildCardProductItemText(),
        ],
      ),
    );
  }

  Widget _buildCardProductItemText() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildCardText(),
              ),
              _buildCardIconButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardPriceText(),
              _buildCardCounter(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.cardProductItem.product?.title ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        Wrap(
          spacing: 16,
          children: [
            Text(
              'Colors: ${widget.cardProductItem.color ?? ''}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
            Text(
              'Size: ${widget.cardProductItem.price ?? ''}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardPriceText() {
    return Text(
      '\$ ${widget.cardProductItem.price ?? 0}',
      style: const TextStyle(
        color: AppColorsPath.primaryColors,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }

  Widget _buildCardCounter() {
    return ItemCount(
      color: AppColorsPath.primaryColors,
      initialValue: _counterListItem,
      minValue: 1,
      maxValue: 10,
      decimalPlaces: 0,
      onChanged: (value) {
        // print('Selected value: $value');
        _counterListItem = value as int;
        Get.find<CartListController>().changeProductQuantity(
          widget.cardProductItem.id!,
          _counterListItem,
        );
      },
    );
  }

  Widget _buildCardIconButton() {
    return IconButton(
      icon: const Icon(Icons.delete_outline),
      onPressed: () {},
    );
  }

  Widget _buildCardProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetsPath.shoesImageUrl,
        width: 100,
      ),
    );
  }
}
