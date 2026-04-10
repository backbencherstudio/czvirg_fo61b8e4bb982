import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/presentation/custom_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import 'widgets/benefit_card.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
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
                Text(
                  'Your Progress',
                  style: GoogleFonts.armata(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.titleText,
                  ),
                ),
                20.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
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
                            IconManager.books,
                            height: 22.h,
                            width: 22.w,
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Helpful Resources',
                            style: getSemiBold600Style16(
                              color: ColorManager.textPrimary,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'Science-backed reasons to\nbreathe with intention',
                            style: getRegular400Style12(
                              color: ColorManager.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorManager.primary,
                        size: 24.r,
                      ),
                    ],
                  ),
                ),

                24.verticalSpace,

                Text(
                  'Video Resources',
                  style: getSemiBold600Style16(color: ColorManager.textPrimary),
                ),

                16.verticalSpace,
                ListView.separated(
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return 12.verticalSpace;
                  },
                  itemBuilder: (context, index) {
                    return BenefitCard(
                      title: 'Box Breathing with Mark Divine',
                      icon: IconManager.playIcon,
                    );
                  },
                ),

                24.verticalSpace,

                Text(
                  'Scientific Articles',
                  style: getSemiBold600Style16(color: ColorManager.textPrimary),
                ),

                16.verticalSpace,
                ListView.separated(
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return 12.verticalSpace;
                  },
                  itemBuilder: (context, index) {
                    return BenefitCard(
                      title: 'Box Breathing with Mark Divine',
                      icon: IconManager.epDocument,
                    );
                  },
                ),
                24.verticalSpace,
                PrimaryButton(title: 'Start Breathing', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
