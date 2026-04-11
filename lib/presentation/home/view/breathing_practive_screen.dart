import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/image_manager.dart';
import '../../../core/route/route_name.dart';
import '../../../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
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
                  ImageManager.cvLogo,
                  height: 122.h,
                  width: double.infinity,
                ),
              ),
              24.verticalSpace,
              Text(
                l10n.breathingPractices,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.titleText,
                  fontFamily: 'Armada',
                ),
              ),
              8.verticalSpace,
              Text(
                l10n.chooseATechniqueThatMatchesYourNeeds,
                style: getRegular400Style14(color: ColorManager.textSecondary),
              ),
              24.verticalSpace,
              ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final practice = BreathPracticeData.getPractices(
                    context,
                  )[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.pushNamed(
                          context,
                          RouteName.inhaleHoldExhaleScreen,
                        );
                      }
                    },
                    child: BreathPracticeCard(
                      breathPracticeModel: practice,
                      isCustom: practice.isCustom,
                      isSelected: practice.isSelected,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return 16.verticalSpace;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
