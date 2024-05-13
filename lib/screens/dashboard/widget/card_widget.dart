import 'package:bloc_practice/config/app_colors.dart';
import 'package:bloc_practice/config/app_text_style.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const CardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyle.text16B700,
              ),
              const SizedBox(height: 10),
              Icon(
                icon,
                color: AppColors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
