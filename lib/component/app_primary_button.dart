import 'package:flutter/material.dart';

import '../app_constant/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  AppPrimaryButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(30),
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
