import 'package:flutter/material.dart';
import 'package:zomoto/app_constant/app_colors.dart';

import '../model/food_item.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem? item;

  const FoodItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.asset(
                  item?.image ?? "",
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 6),
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Text(
                            item?.foodType ?? "",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 5,
                bottom: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.white,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.flash_on,
                        color: AppColors.green,
                        size: 14,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        item?.arrivalMins ?? "",
                        style: const TextStyle(
                            color: AppColors.green, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item?.foodname ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.green,
                      ),
                      child: Row(
                        children: [
                          Text(item?.review.toString() ?? ""),
                          const Icon(Icons.star, size: 15),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(item?.additionalFood ?? ""),
                    const SizedBox(width: 5),
                    const _Dot(),
                    const SizedBox(width: 5),
                    Text(item?.foodType ?? ""),
                    const SizedBox(width: 5),
                    const _Dot(),
                    const SizedBox(width: 5),
                    Text("₹${item?.foodCost}"),
                  ],
                ),
                const Divider(thickness: 1),
                Row(
                  children: [
                    _OfferText(
                      text: item?.offer ?? "",
                      iconImg: 'assets/offerIcon_image.png',
                      color: AppColors.golden,
                    ),
                    const SizedBox(width: 10),
                    _OfferText(
                      text: item?.extraOffer ?? "",
                      iconImg: 'assets/offerIcon_image.png',
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OfferText extends StatelessWidget {
  final String text;
  final Color color;
  final String iconImg;

  const _OfferText({
    super.key,
    required this.text,
    required this.iconImg,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconImg,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
    );
  }
}
