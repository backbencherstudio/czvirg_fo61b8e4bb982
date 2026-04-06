import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/constansts/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constansts/color_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageManager.homeImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              60.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: ColorManager.primary.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorManager.primary),
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
                          IconManager.exercisesSvg,
                          height: 44.h,
                          width: 44.w,
                        ),
                      ),
                    ),
                    12.horizontalSpace,
                    Column(children: [
                      Text('')
                    ],)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
