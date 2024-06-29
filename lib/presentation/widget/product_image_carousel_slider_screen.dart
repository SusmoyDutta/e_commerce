import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSliderScreen extends StatefulWidget {
  const ProductImageCarouselSliderScreen({super.key, required this.image});

  final List<String> image;

  @override
  State<ProductImageCarouselSliderScreen> createState() =>
      _ProductImageCarouselSliderScreenState();
}

class _ProductImageCarouselSliderScreenState
    extends State<ProductImageCarouselSliderScreen> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: _buildDotIndicator(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },
        height: 220,
        viewportFraction: 1,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: widget.image.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
              child: NetworkCachedImage(
                url: image,
                height: double.maxFinite,
                width: double.maxFinite,
                boxFit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
      valueListenable: _selectedPageIndex,
      builder: (BuildContext context, value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.image.length; i++)
              Container(
                height: 15,
                width: 15,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i == value
                      ? AppColorsPath.primaryColors
                      : Colors.grey.shade200,
                  border: Border.all(
                    color: i == value
                        ? AppColorsPath.primaryColors
                        : Colors.grey.shade200,
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
          ],
        );
      },
    );
  }
}
