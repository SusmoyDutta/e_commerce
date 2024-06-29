import 'package:e_commerce/data/models/review_by_product_data.dart';
import 'package:e_commerce/presentation/screen/create_reviews_screen.dart';
import 'package:e_commerce/presentation/state_holders/review_by_product_controller.dart';
import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ReviewByProductController>().getReviewByProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewByProductController>(
          builder: (reviewByProductController) {
        if (reviewByProductController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: reviewByProductController.review.length,
                  itemBuilder: (context, int index) {
                    return buildCardReviews(
                        reviewByProductController.review[index]);
                  },
                ),
              ),
            ),
            _buildCardPriceCheckout(),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColorsPath.primaryColors,
        onPressed: () {
          Get.to(() => const CreateReviewsScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCardPriceCheckout() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: AppColorsPath.primaryColors.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTotalPrice(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPrice() {
    return const Wrap(
      spacing: 15,
      children: [
        Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        Text(
          "(1000)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildCardReviews(ReviewByProductData review) {
    return Card(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(
                      Icons.person_outline_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    review.profile?.cusName ?? '',
                    // review['profile']['cus_name'] ??'',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${review.description ?? ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    'Rating: ${review.rating ?? ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    'updated time: ${review.updatedAt ?? ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    'created time: ${review.createdAt ?? ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
