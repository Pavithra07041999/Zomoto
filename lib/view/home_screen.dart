import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zomoto/app_constant/app_colors.dart';
import 'package:zomoto/component/custom_appbar.dart';
import 'package:zomoto/controller/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:zomoto/model/food_item.dart';
import 'package:zomoto/view/add_data_item_details.dart';

import '../component/food_item_card.dart';
import '../component/app_primary_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: _SearchBox(),
              ),
              _buildListViewofFood(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                child: AppPrimaryButton(
                  text: "Next",
                  onPressed: () {
                    Get.to(AddItemFormDetailsScreen());
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => controller.orderData.value != null
                  ? OrderCard(
                      profileImageUrl:
                          controller.orderData.value?.imagePath ?? "",
                      name: controller.orderData.value?.name ?? "",
                      address: controller.orderData.value?.address ?? "",
                      quantity: controller.orderData.value?.quantity ?? "",
                    )
                  : Container())
            ],
          ),
        ));
  }

  Widget _buildListViewofFood() {
    return Obx(() => ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: controller.filteredItems.length,
        itemBuilder: (context, index) {
          FoodItem item = controller.filteredItems[index];
          return FoodItemCard(item: item);
        }));
  }
}

class _SearchBox extends StatelessWidget {
  _SearchBox({super.key});
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey300,
          ),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            color: Colors.redAccent,
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Search Items"),
              onChanged: (value) => controller.searchFilter(value),
            ),
          ),
          Container(
            height: 25,
            width: 2,
            decoration: BoxDecoration(
                color: AppColors.greyShade,
                borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.mic_none_outlined,
            color: AppColors.redAccent,
          )
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String address;
  final String quantity;

  OrderCard({
    required this.profileImageUrl,
    required this.name,
    required this.address,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(profileImageUrl)),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: AppColors.grey300,
                  width: 1.0,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.grey600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Quantity: $quantity',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColors.black,
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
