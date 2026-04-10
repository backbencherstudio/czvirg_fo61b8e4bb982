import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/constansts/icon_manager.dart';
import '../../../../core/resource/style_manager.dart';

class BenefitCard extends StatelessWidget {
  const BenefitCard({super.key, required this.title, required this.icon});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface2.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorManager.borderColor2),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, height: 20.h, width: 20.w),
          8.horizontalSpace,
          Text(
            title,
            style: getSemiBold600Style16(color: ColorManager.textPrimary),
          ),
          const Spacer(),
          SvgPicture.asset(IconManager.fluentShare, height: 20.h, width: 20.w),
        ],
      ),
    );
  }
}
