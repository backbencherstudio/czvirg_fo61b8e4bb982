import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constansts/color_manger.dart';
import '../viewmodel/setting_toggle_provider.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsList = ref.watch(settingsProvider);
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SESSION PREFERENCES',
                        style: getMedium500Style14(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                      16.verticalSpace,
                      ListView.separated(
                        itemCount: settingsList.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => 12.verticalSpace,
                        itemBuilder: (context, index) {
                          final setting = settingsList[index];
                          return SettingItem(
                            title: setting.title,
                            icon: setting.icon,
                            isSelected: setting.isSelected,
                            onChanged: (value) {
                              ref
                                  .read(settingsProvider.notifier)
                                  .toggle(index, value);
                            },
                          );
                        },
                      ),
                      24.verticalSpace,
                      Text(
                        'ABOUT',
                        style: getMedium500Style14(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                      16.verticalSpace,

                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundSurface2,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: ColorManager.borderColor2),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Version',
                                  style: getBold700Style16(
                                    color: ColorManager.textPrimary,
                                  ),
                                ),
                                Text(
                                  '1.0.0',
                                  style: getMedium500Style14(
                                    color: ColorManager.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Divider(
                                color: ColorManager.borderColor2,
                                thickness: 1.r,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Clara Vida',
                                  style: getBold700Style16(
                                    color: ColorManager.textPrimary,
                                  ),
                                ),
                                Text(
                                  'Breathe-Be-Become',
                                  style: getMedium500Style14(
                                    color: ColorManager.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
