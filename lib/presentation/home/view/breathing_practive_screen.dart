import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/image_manager.dart';
import '../model/breath_practice_model.dart';
import 'widgets/breath_practice_card.dart';

class BreathingPractiveScreen extends StatefulWidget {
  const BreathingPractiveScreen({super.key});

  @override
  State<BreathingPractiveScreen> createState() =>
      _BreathingPractiveScreenState();
}

class _BreathingPractiveScreenState extends State<BreathingPractiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
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
                ImageManager.cvLogo,
                height: 122.h,
                width: 195.w,
              ),
            ),
            24.verticalSpace,
            Text(
              'Breathing Practices',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.titleText,
                fontFamily: 'Armada',
              ),
            ),
            8.verticalSpace,
            Text(
              'Choose a technique that matches your needs',
              style: getRegular400Style14(color: ColorManager.textSecondary),
            ),
            24.verticalSpace,
            ListView.separated(
              itemBuilder: (context, index) {
                final practice = BreathPracticeData.practices[index];
                return BreathPracticeCard(
                  breathPracticeModel: practice,
                  isCustom: practice.isCustom,
                  isSelected: practice.isSelected,
                );
              },
              separatorBuilder: (context, index) {
                return 16.verticalSpace;
              },
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}

