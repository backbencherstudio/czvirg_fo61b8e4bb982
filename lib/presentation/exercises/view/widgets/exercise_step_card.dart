import 'package:czvirg_fo61b8e4bb982/core/constansts/color_manger.dart';
import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseStepCard extends StatelessWidget {
  final String title;
  final int durationSec;
  final String icon;

  const ExerciseStepCard({
    super.key,
    required this.title,
    required this.durationSec,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface2,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorManager.borderColor, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon, height: 24.h, width: 24.w),
              8.horizontalSpace,
              Text(
                title,
                style: getMedium500Style16(color: ColorManager.textPrimary),
              ),
            ],
          ),
          Text(
            '${durationSec}sec',
            style: getSemiBold600Style16(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
