import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zomoto/model/order_model.dart';
import '../model/food_item.dart';

class HomePageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final RxList<FoodItem> filteredItems = <FoodItem>[].obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final selectedImagePath = Rx<String?>(null);
  final orderData = Rx<OrderModel?>(null);

  setOrderData(OrderModel? order) {
    orderData.value = order;
  }

  resetOrder() {
    nameController.clear();
    addressController.clear();
    quantityController.clear();
    selectedImagePath.value = null;
  }

  submitOrder() {
    if (selectedImagePath.value == null) {
      Get.snackbar("", "Please Select Image");

      return null;
    }
    bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    OrderModel order = OrderModel(
        address: addressController.text,
        name: nameController.text,
        quantity: quantityController.text,
        imagePath: selectedImagePath.value);
    setOrderData(order);

    resetOrder();
    Get.back();
  }

  List<FoodItem> listOfItems = [
    FoodItem(
      image: 'assets/food_img01.jpg',
      foodType: 'Fish fry!',
      review: 4.5,
      cost: 12.99,
      offer: 'Extra 10% OFF',
      arrivalMins: "ARRIVED",
      extraOffer: '30% OFF up to ₹60',
      foodname: 'Fish Fry',
      additionalFood: 'Fish',
      foodCost: 90,
    ),
    FoodItem(
      image: 'assets/food_img02.jpg',
      foodType: 'Burgar combo ',
      review: 4.8,
      cost: 15.99,
      offer: 'Buy 1 Get 1 Free',
      arrivalMins: "NEAR & FAST",
      extraOffer: '40% OFF up to ₹80',
      foodname: 'burgar',
      additionalFood: 'biriyani',
      foodCost: 90,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    filteredItems.addAll(listOfItems);
  }

  void chooseImage({required ImageSource source}) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage == null) return;
    selectedImagePath.value = pickedImage.path;
  }

  void searchFilter(String query) {
    if (query.isEmpty) {
      filteredItems.value = listOfItems;
    } else {
      filteredItems.value = listOfItems
          .where((item) =>
              item.foodname.toLowerCase().contains(query.toLowerCase()) ||
              item.foodType.toLowerCase().contains(query.toLowerCase()) ||
              item.additionalFood.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
