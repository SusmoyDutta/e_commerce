import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/models/slider_data.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
    required this.sliderList,
  });

  final List<CategoryList> sliderList;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(
          height: 12,
        ),
        _buildDotIndicator(),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },
        height: 180.0,
        viewportFraction: 1,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: widget.sliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  _buildNetworkImage(slider),
                  _buildTitleShortTitle(slider),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildNetworkImage(CategoryList slider) {
    return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: NetworkCachedImage(
                    url: slider.image ?? '',
                    height: double.maxFinite,
                    width: double.maxFinite,
                    boxFit: BoxFit.cover,
                  ),
                );
  }

  Widget _buildTitleShortTitle(CategoryList slider) {
    return Padding(
                  padding: const EdgeInsets.only(top: 16,left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        slider.title ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          slider.shortDes ?? '',
                          maxLines: 3,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColorsPath.primaryColors,
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('Buy Now'),
                        ),
                      ),
                    ],
                  ),
                );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
      valueListenable: _selectedPageIndex,
      builder: (BuildContext context, value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.sliderList.length; i++)
              Container(
                height: 15,
                width: 15,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i == value ? AppColorsPath.primaryColors : null,
                  border: Border.all(
                    color: i == value
                        ? AppColorsPath.primaryColors
                        : Colors.grey.shade400,
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
