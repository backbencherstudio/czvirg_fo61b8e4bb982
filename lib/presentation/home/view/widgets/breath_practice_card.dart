import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/resource/style_manager.dart';
import '../../model/breath_practice_model.dart';

class BreathPracticeCard extends StatelessWidget {
  const BreathPracticeCard({
    super.key,
    this.isCustom = false,
    this.onTap,
    this.isSelected = false,
    required this.breathPracticeModel,
  });

  final BreathPracticeModel breathPracticeModel;
  final bool? isCustom;
  final VoidCallback? onTap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: ColorManager.primary.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected == true ? ColorManager.primary : Colors.transparent,
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
              child: SvgPicture.asset(
                breathPracticeModel.image,
                height: 44.h,
                width: 44.w,
              ),
            ),
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    breathPracticeModel.title,
                    style: getSemiBold600Style16(
                      color: ColorManager.textPrimary,
                    ),
                  ),
                  8.horizontalSpace,
                  isCustom == false
                      ? Text(
                          breathPracticeModel.time,
                          style: getRegular400Style12(
                            color: ColorManager.textSecondary,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              4.verticalSpace,
              Text(
                breathPracticeModel.subTitle,
                style: getRegular400Style12(color: ColorManager.textSecondary),
              ),
              8.verticalSpace,
              isCustom == false
                  ? Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.primary.withValues(alpha: 0.13),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'Beginner',
                            style: getRegular400Style12(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.primary.withValues(alpha: 0.13),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'Balance',
                            style: getRegular400Style12(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.primary.withValues(alpha: 0.13),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'Daily Use',
                            style: getRegular400Style12(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorManager.primary,
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
