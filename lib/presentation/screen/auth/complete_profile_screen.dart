import 'package:e_commerce/data/models/create_profile_data.dart';
import 'package:e_commerce/presentation/state_holders/complete_create_profile_controller.dart';
import 'package:e_commerce/presentation/widget/app_logo.dart';
import 'package:e_commerce/presentation/widget/center_circular_progress_indicator.dart';
import 'package:e_commerce/presentation/widget/snake_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({
    super.key,
  });


  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _stateTEController = TextEditingController();
  final TextEditingController _postcodeTEController = TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _faxTEController = TextEditingController();
  final TextEditingController _customerEController = TextEditingController();
  final TextEditingController _shippingPhoneEController =
      TextEditingController();
  final TextEditingController _shippingCityEController =
      TextEditingController();
  final TextEditingController _shippingStateEController =
      TextEditingController();
  final TextEditingController _shippingPostcodeEController =
      TextEditingController();
  final TextEditingController _shippingCountyEController =
      TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _idTEController = TextEditingController();
  final TextEditingController _userIdTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Complete Profile',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Get Started with us with your details',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Fast Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Last Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Mobile';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _cityTEController,
                  decoration: const InputDecoration(
                    hintText: 'City',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your City';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _stateTEController,
                  decoration: const InputDecoration(
                    hintText: 'State',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your State';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _postcodeTEController,
                  decoration: const InputDecoration(
                    hintText: 'Postcode',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Postcode';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _countryTEController,
                  decoration: const InputDecoration(
                    hintText: 'Country',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Country';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _faxTEController,
                  decoration: const InputDecoration(
                    hintText: 'Fax',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Fax';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 3,
                  controller: _customerEController,
                  decoration: const InputDecoration(
                    hintText: 'Customer Address',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Customer Address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shippingPhoneEController,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Phone',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping Phone';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shippingCityEController,
                  decoration: const InputDecoration(
                    hintText: 'Shipping City',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping City';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shippingStateEController,
                  decoration: const InputDecoration(
                    hintText: 'Shipping State',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping State';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shippingPostcodeEController,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Postcode',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping Postcode';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shippingCountyEController,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Country',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping Country';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 3,
                  controller: _shippingAddressTEController,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Address',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping Address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<CompleteCreateProfileController>(
                    builder: (completeCreateProfileController) {
                  if (completeCreateProfileController.inProgress) {
                    return const CenterCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        CreateProfileData createProfile =
                            CreateProfileData(
                          cusName: _firstNameTEController.text,
                          cusAdd: _addressTEController.text,
                          cusCity: _cityTEController.text,
                          cusState: _stateTEController.text,
                          cusPostcode: _postcodeTEController.text,
                          cusCountry: _countryTEController.text,
                          cusPhone: _mobileTEController.text,
                          cusFax: _faxTEController.text,
                          shipName: _lastNameTEController.text,
                          shipAdd: _shippingAddressTEController.text,
                          shipCity: _shippingCityEController.text,
                          shipState: _shippingStateEController.text,
                          shipPostcode: _shippingPostcodeEController.text,
                          shipCountry: _shippingCountyEController.text,
                          shipPhone: _shippingPhoneEController.text,
                          updatedAt: DateTime.now().toString(),
                          createdAt: DateTime.now().toString(),
                          userId: _userIdTEController.text,
                          id: int.tryParse(_idTEController.text)??0,
                        );
                        bool isSuccess = await completeCreateProfileController
                            .getCreateProfile(createProfile);
                        if (isSuccess) {
                          const ShowSnakeBarMessage(
                              title: 'Profile is Success');
                         // Get.to(()=>const HomeScreen());
                          Get.back();
                        } else {
                          if (mounted) {
                            ShowSnakeBarMessage(
                              title:
                                  completeCreateProfileController.errorMessage,
                            );
                          }
                        }
                      }
                    },
                    child: const Text('Next'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _stateTEController.dispose();
    _postcodeTEController.dispose();
    _faxTEController.dispose();
    _customerEController.dispose();
    _idTEController.dispose();
    _userIdTEController.dispose();
    _shippingPhoneEController.dispose();
    _shippingPostcodeEController.dispose();
    _shippingCountyEController.dispose();
    _shippingStateEController.dispose();
    _shippingCityEController.dispose();
    _shippingAddressTEController.dispose();

    super.dispose();
  }
}
