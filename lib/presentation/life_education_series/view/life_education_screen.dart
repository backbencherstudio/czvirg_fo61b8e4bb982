import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/constansts/image_manager.dart';
import '../../../core/resource/style_manager.dart';

class LifeEducationScreen extends StatefulWidget {
  const LifeEducationScreen({super.key});

  @override
  State<LifeEducationScreen> createState() => _LifeEducationScreenState();
}

class _LifeEducationScreenState extends State<LifeEducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: ColorManager.whiteColor,
                  ),
                ),
                16.verticalSpace,
                Center(
                  child: Image.asset(
                    ImageManager.homeImage,
                    height: 153.h,
                    width: double.infinity,
                  ),
                ),
                24.verticalSpace,
                Center(
                  child: Text(
                    'Life Optimization Series',
                    style: getSemiBold600Style20(
                      color: ColorManager.whiteColor,
                    ),
                  ),
                ),
                8.verticalSpace,
                Center(
                  child: Text(
                    '7 Videos',
                    style: getRegular400Style14(
                      color: ColorManager.textSecondary,
                    ),
                  ),
                ),
                16.verticalSpace,
                Divider(color: ColorManager.borderColor2, thickness: 2.w),
                24.verticalSpace,

                ListView.separated(
                  itemCount: 7,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return 12.verticalSpace;
                  },
                  itemBuilder: (context, index) {
                    return VideoSeries();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoSeries extends StatelessWidget {
  const VideoSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface2.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.borderColor2),
      ),
      child: Row(
        children: [
          Text(
            '1',
            style: getMedium500Style16(color: ColorManager.textSecondary),
          ),
          12.horizontalSpace,
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.borderColor3, width: 2.w),
              color: ColorManager.backgroundSurface2,
            ),
            child: SvgPicture.asset(
              IconManager.play,
              height: 16.h,
              width: 16.w,
            ),
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fast Video",
                style: getMedium500Style16(color: ColorManager.whiteColor),
              ),
              4.verticalSpace,
              Text(
                "1x March 28, 2026",
                style: getRegular400Style14(color: ColorManager.textSecondary),
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(IconManager.fluentShare, height: 24.h, width: 24.w),
        ],
      ),
    );
  }
}
