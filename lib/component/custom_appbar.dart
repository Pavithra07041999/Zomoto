import 'package:flutter/material.dart';
import 'package:zomoto/app_constant/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightOrange,
      title: Row(
        children: [
          const Icon(Icons.location_on, color: AppColors.redAccent, size: 30),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
                Text(
                  'Btm 2nd Stage, Tamil Nadu',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          _buildOffersContainer(),
          const SizedBox(width: 8),
          _buildProfileIcon(),
        ],
      ),
    );
  }

  Widget _buildOffersContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Image.asset("assets/offerIcon_image.png", width: 20, height: 20),
          const SizedBox(width: 5),
          const Text(
            "Offers",
            style: TextStyle(color: AppColors.blue, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.blue,
      ),
      child: const Center(child: Text("P")),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
