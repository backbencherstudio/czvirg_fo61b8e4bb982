import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/constansts/image_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';
import '../viewmodel/role_selection_provider.dart';
import 'widgets/menu_selection_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedRole = ref.watch(roleSelectionProvider);
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageManager.homeImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 210.h,
              ),
              60.verticalSpace,
              GestureDetector(
                onTap: () {
                  ref
                      .read(roleSelectionProvider.notifier)
                      .selectRole('breathing');
                  Navigator.pushNamed(
                    context,
                    RouteName.breathingPractiveScreen,
                  );
                },
                child: MenuSelectionCard(
                  title: l10n.breathingPractices,
                  subtitle: l10n.startYourSession,
                  iconPath: IconManager.exercisesSvg,
                  isSelected: selectedRole == 'breathing',
                ),
              ),
              16.verticalSpace,
              GestureDetector(
                onTap: () {
                  ref
                      .read(roleSelectionProvider.notifier)
                      .selectRole('education');
                  Navigator.pushNamed(context, RouteName.lifeEducationScreen);
                },
                child: MenuSelectionCard(
                  title: l10n.lifeEducationSeries,
                  subtitle: l10n.videoLibraryAndResources,
                  iconPath: IconManager.educationSvg,
                  isSelected: selectedRole == 'education',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
