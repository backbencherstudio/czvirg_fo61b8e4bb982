import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/resource/style_manager.dart';

class MenuSelectionCard extends StatelessWidget {
  const MenuSelectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.isSelected = false,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isSelected == true
            ? ColorManager.primary.withValues(alpha: 0.13)
            : ColorManager.backgroundSurface2,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected ? ColorManager.primary : ColorManager.borderColor2,
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.13),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: SvgPicture.asset(iconPath, height: 44.h, width: 44.w),
            ),
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getSemiBold600Style16(color: ColorManager.textPrimary),
              ),
              4.verticalSpace,
              Text(
                subtitle,
                style: getRegular400Style12(color: ColorManager.textSecondary),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorManager.textPrimary,
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
