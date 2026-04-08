import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constansts/color_manger.dart';
import '../../custom_widgets/primary_button.dart';
import '../viewmodel/manage_stage_provider.dart';

class InhaleHoldExhaleScreen extends ConsumerStatefulWidget {
  const InhaleHoldExhaleScreen({super.key});

  @override
  ConsumerState<InhaleHoldExhaleScreen> createState() =>
      _InhaleHoldExhaleScreenState();
}

class _InhaleHoldExhaleScreenState
    extends ConsumerState<InhaleHoldExhaleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(manageStageProvider.notifier).state = 'end';
    });
  }

  @override
  Widget build(BuildContext context) {
    final stage = ref.watch(manageStageProvider);

    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // Top Bar (Always visible)
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

              // ACTIVE STATE UI
              if (stage == 'active') ...[
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(30.r),
                  decoration: BoxDecoration(
                    color: ColorManager.primary.withValues(alpha: 0.13),
                    shape: BoxShape.circle,
                  ),
                  child: CircularPercentIndicator(
                    radius: 100.r,
                    lineWidth: 10.w,
                    percent: 0.5,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: ColorManager.primary.withValues(
                      alpha: 0.2,
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LinearPercentIndicator(
                              width: 106.w,
                              lineHeight: 6.h,
                              percent: 0.5,
                              barRadius: Radius.circular(10.r),
                              backgroundColor: Colors.white24,
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
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    ref.read(manageStageProvider.notifier).state = 'stop';
                  },
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
              ]
              // STOP / PAUSED STATE UI
              else if (stage == 'stop') ...[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                      20.verticalSpace,
                      Text(
                        'Paused',
                        style: getMedium500Style28(
                          color: ColorManager.whiteColor,
                        ),
                      ),
                      24.verticalSpace,
                      PrimaryButton(
                        title: 'Resume Session',
                        onTap: () {
                          ref.read(manageStageProvider.notifier).state =
                              'active';
                        },
                      ),
                      16.verticalSpace,
                      PrimaryButton(
                        title: 'Quit Session',
                        containerColor: ColorManager.transparentColor,
                        border: Border.all(color: ColorManager.borderColor),
                        textStyle: getMedium500Style16(
                          color: ColorManager.primary,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ]
              // END STATE UI
              else if (stage == 'end') ...[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(IconManager.iconsCelebrate),
                          12.horizontalSpace,
                          Text(
                            'Session Complete!',
                            style: getMedium500Style24(
                              color: ColorManager.whiteColor,
                            ),
                          ),
                          12.horizontalSpace,
                          SvgPicture.asset(IconManager.iconsCelebrate),
                        ],
                      ),
                      10.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        '"Well done. Take a moment to\nnotice how you feel."',
                        style: getMedium500Style16(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                      32.verticalSpace,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withValues(alpha: 0.13),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 1.w,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Session Summary',
                              style: getSemiBold600Style18(
                                color: ColorManager.primary,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: SizedBox(
                                width: 227.w,
                                child: Divider(
                                  color: ColorManager.primary.withValues(
                                    alpha: 0.33,
                                  ),
                                ),
                              ),
                            ),

                            SessionSummary(
                              title: 'Duration',
                              value: '5:00 min',
                              iconPath: IconManager.time,
                            ),
                            8.verticalSpace,
                            SessionSummary(
                              title: 'Cycles',
                              value: '5',
                              iconPath: IconManager.cycles,
                            ),
                            8.verticalSpace,
                            SessionSummary(
                              title: 'Mode',
                              value: '4-7-8',
                              iconPath: IconManager.mode,
                            ),
                          ],
                        ),
                      ),
                      32.verticalSpace,
                      PrimaryButton(
                        title: 'Breathe Again',
                        onTap: () {
                          ref.read(manageStageProvider.notifier).state =
                              'active';
                        },
                      ),
                      16.verticalSpace,
                      PrimaryButton(
                        title: 'Return Home',
                        containerColor: ColorManager.transparentColor,
                        border: Border.all(color: ColorManager.borderColor),
                        textStyle: getMedium500Style16(
                          color: ColorManager.primary,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],

              // Bottom padding (Always applied)
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class SessionSummary extends StatelessWidget {
  const SessionSummary({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
  });
  final String title;
  final String value;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        12.horizontalSpace,
        Text(
          title,
          style: getRegular400Style14(color: ColorManager.textPrimary),
        ),
        Spacer(),
        Text(
          value,
          style: getSemiBold600Style16(color: ColorManager.textPrimary),
        ),
      ],
    );
  }
}
