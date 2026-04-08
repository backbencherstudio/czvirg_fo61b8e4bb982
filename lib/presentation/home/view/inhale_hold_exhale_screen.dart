import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constansts/color_manger.dart';

class InhaleHoldExhaleScreen extends StatefulWidget {
  const InhaleHoldExhaleScreen({super.key});

  @override
  State<InhaleHoldExhaleScreen> createState() => _InhaleHoldExhaleScreenState();
}

class _InhaleHoldExhaleScreenState extends State<InhaleHoldExhaleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    IconManager.speaker,
                    height: 24.h,
                    width: 24.h,
                  ),
                  Text(
                    '0 : 59',
                    style: getMedium500Style16(color: ColorManager.primary),
                  ),
                  SvgPicture.asset(
                    IconManager.biPhone,
                    height: 24.h,
                    width: 24.h,
                  ),
                ],
              ),

              const Spacer(), // Pushes content to the middle/bottom
              // Main Animation Circle
              Container(
                padding: EdgeInsets.all(30.r),
                decoration: BoxDecoration(
                  color: ColorManager.primary.withValues(alpha: 0.13),
                  shape: BoxShape.circle,
                ),
                child: CircularPercentIndicator(
                  radius: 100.r, // Use ScreenUtil for radius
                  lineWidth: 10.w,
                  percent: 0.5,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: ColorManager.primary.withValues(alpha: 0.2),
                  progressColor: ColorManager.primary,
                  center: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'INHALE',
                        style: getMedium500Style28(
                          color: ColorManager.whiteColor,
                        ),
                      ),
                      12.verticalSpace,
                      // The fix: Center the linear indicator and handle its width
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LinearPercentIndicator(
                            width: 100.w,
                            lineHeight: 6.h,
                            percent: 0.5,
                            barRadius: Radius.circular(10.r),
                            backgroundColor:
                                Colors.white24, // Use a themed grey
                            progressColor: ColorManager.whiteColor,
                            alignment: MainAxisAlignment.center,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Text(
                        '5 cycles left',
                        style: getRegular400Style12(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(), // Flexible spacing is better than hardcoded verticalSpace
              // Stop Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: ColorManager.primary.withValues(alpha: 0.13),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.33),
                      width: 2.w,
                    ),
                  ),
                  child: SvgPicture.asset(
                    IconManager.iconsStop,
                    height: 44.h,
                    width: 44.w,
                  ),
                ),
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
