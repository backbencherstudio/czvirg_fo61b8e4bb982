import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/icon_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: GoogleFonts.armata(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.titleText,
                ),
              ),
              20.verticalSpace,
              Text(
                'SESSION PREFERENCES',
                style: getMedium500Style14(color: ColorManager.textSecondary),
              ),
              16.verticalSpace,
              ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemBuilder: (context, index) {
                  return SettingItem(
                    title: "Dr. Weil's 4-7-8 Breathing",
                    icon: IconManager.speaker,
                    isSelected: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });
  final String title;
  final String icon;
  final bool isSelected;
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
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
