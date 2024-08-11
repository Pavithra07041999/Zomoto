import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:zomoto/app_constant/app_colors.dart';

import '../component/app_primary_button.dart';
import '../controller/home_page_controller.dart';

class AddItemFormDetailsScreen extends StatelessWidget {
  AddItemFormDetailsScreen({super.key});

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.grey100,
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: Column(
                children: [
                  const Text(
                    "Enter Your Order Details ",
                    style: TextStyle(
                        color: AppColors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        _openImageSourceModal(Get.context!);
                      },
                      child: ClipOval(
                        child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: controller.selectedImagePath.value == null
                                ? const Icon(Icons.person)
                                : Image.file(
                                    fit: BoxFit.cover,
                                    File(controller.selectedImagePath.value ??
                                        ""),
                                    errorBuilder: (context, data, e) {
                                      return const Icon(Icons.person);
                                    },
                                  )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    labelName: "Enter Your Name",
                    controller: controller.nameController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) return "Required!";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    labelName: "Enter Your Address",
                    maxLines: 3,
                    controller: controller.addressController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) return "Required!";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    labelName: "Quantity",
                    keyboardType: TextInputType.number,
                    controller: controller.quantityController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) return "Required!";
                      return null;
                    },
                  ),
                  const SizedBox(height: 44),
                  AppPrimaryButton(
                    text: "Order",
                    onPressed: () {
                      controller.submitOrder();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openImageSourceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Choose From Gallery'),
                onTap: () async {
                  Get.back();
                  controller.chooseImage(source: ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Get.back();
                  controller.chooseImage(source: ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? labelName;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    this.labelName,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              offset: const Offset(-3, 3),
              blurRadius: 1)
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelName,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        ),
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }
}
