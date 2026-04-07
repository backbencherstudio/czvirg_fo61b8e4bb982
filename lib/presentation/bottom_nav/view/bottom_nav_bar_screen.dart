import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../l10n/app_localizations.dart';
import '../../home/view/home_screen.dart';
import '../viewmodel/bottom_nav_provider.dart';

class BottomNavBarScreen extends ConsumerWidget {
  const BottomNavBarScreen({super.key});

  /// Screens for bottom navigation
  static const List<Widget> _screens = [
    HomeScreen(),
    Scaffold(body: Center(child: Text("Exercises"))),
    Scaffold(body: Center(child: Text("Progress"))),
    Scaffold(body: Center(child: Text("Benefits"))),
    Scaffold(body: Center(child: Text("Settings"))),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    final l10n = AppLocalizations.of(context)!;
    final navItems = [
      _buildNavItem(
        label: l10n.home,
        iconPath: IconManager.homeSvg,
        isSelected: currentIndex == 0,
      ),
      _buildNavItem(
        label: l10n.exercises,
        iconPath: IconManager.exercisesSvg,
        isSelected: currentIndex == 1,
      ),
      _buildNavItem(
        label: l10n.progress,
        iconPath: IconManager.progressSvg,
        isSelected: currentIndex == 2,
      ),
      _buildNavItem(
        label: l10n.benefits,
        iconPath: IconManager.benefitsSvg,
        isSelected: currentIndex == 3,
      ),
      _buildNavItem(
        label: l10n.settings,
        iconPath: IconManager.settingsSvg,
        isSelected: currentIndex == 4,
      ),
    ];

    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: ColorManager.whiteColor)),
          color: ColorManager.blackColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(bottomNavIndexProvider.notifier).onTabIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.blackColor,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.textSecondary,
          selectedLabelStyle: getRegular400Style14(color: ColorManager.primary),
          unselectedLabelStyle: getRegular400Style14(
            color: ColorManager.textSecondary,
          ),
          elevation: 0,
          items: navItems,
        ),
      ),
    );
  }

  /// Reusable bottom nav item
  BottomNavigationBarItem _buildNavItem({
    required String label,
    required String iconPath,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SvgPicture.asset(
          iconPath,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
            isSelected ? ColorManager.primary : ColorManager.textSecondary,
            BlendMode.srcIn,
          ),
        ),
      ),

      label: label,
    );
  }
}
