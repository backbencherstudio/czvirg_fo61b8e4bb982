import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constansts/color_manger.dart';
import '../../../../core/resource/style_manager.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });
  final String icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface2,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.borderColor2),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: ColorManager.containerColor1.withValues(alpha: 0.13),
              borderRadius: BorderRadius.circular(12.r),
            ),
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
          8.verticalSpace,
          Text(
            value,
            style: getSemiBold600Style24(color: ColorManager.textPrimary),
          ),
          4.verticalSpace,
          Text(
            label,
            style: getRegular400Style14(color: ColorManager.textPrimary),
          ),
        ],
      ),
    );
  }
}
