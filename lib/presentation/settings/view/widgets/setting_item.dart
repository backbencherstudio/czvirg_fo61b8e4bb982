import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/resource/style_manager.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onChanged,
  });
  final String title;
  final String icon;
  final bool isSelected;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface2,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorManager.borderColor2),
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
              child: SvgPicture.asset(
                icon,
                height: 20.h,
                width: 20.w,
                colorFilter: ColorFilter.mode(
                  ColorManager.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          12.horizontalSpace,
          Text(
            title,
            style: getSemiBold600Style16(color: ColorManager.textPrimary),
          ),
          const Spacer(),
          Transform.scale(
            scale: 1.2,
            child: Switch(
              value: isSelected,
              activeThumbColor: ColorManager.primary,
              activeTrackColor: ColorManager.primary.withValues(alpha: 0.13),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
