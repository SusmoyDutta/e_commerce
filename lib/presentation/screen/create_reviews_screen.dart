import 'package:e_commerce/data/models/create_reviews_data.dart';
import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/presentation/screen/reviews_screen.dart';
import 'package:e_commerce/presentation/state_holders/create_product_review_controller.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/snake_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewsScreen extends StatefulWidget {
  const CreateReviewsScreen({super.key});

  @override
  State<CreateReviewsScreen> createState() => _CreateReviewsScreenState();
}

class _CreateReviewsScreenState extends State<CreateReviewsScreen> {
  final TextEditingController _fastNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _writeReviewsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Product product = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Reviews'),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _fastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Fast Name',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _writeReviewsController,
                  decoration: const InputDecoration(
                    hintText: 'Write Reviews',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Reviews';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _descriptionController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Description';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<CreateProductReviewController>(
                    builder: (createProductReview) {
                  if (createProductReview.inProgress) {
                    return const CenterCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final createReviewsData = CreateReviewsData(
                            description: _descriptionController.text.trim(),
                            rating: int.tryParse(_writeReviewsController.text),
                            createdAt: DateTime.now().toString(),
                            updatedAt: DateTime.now().toString(),
                            id: product.id,
                            productId: product.brandId,
                            customerId: product.categoryId);
                        bool isSuccess = await createProductReview
                            .getCreateProductReview(createReviewsData);
                        if (isSuccess) {
                          Get.off(() => ReviewsScreen(
                                productId: product.id ?? 0,
                              ));
                          const ShowSnakeBarMessage(title: 'Create Review is Success');
                        }
                      } else {
                        ScaffoldMessenger(
                          child: Text(createProductReview.errorMessage),
                        );
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
