import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/route/route_name.dart';
import 'package:czvirg_fo61b8e4bb982/presentation/custom_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../core/utils/share_utils.dart';
import '../../video_player/view/video_player_screen.dart';
import '../model/benefit_model.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Benefits',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: ColorManager.titleText,
                  fontFamily: 'Armada',
                  fontWeight: FontWeight.w400,
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                color: ColorManager.primary.withValues(
                                  alpha: 0.13,
                                ),
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
                        style: getSemiBold600Style16(
                          color: ColorManager.textPrimary,
                        ),
                      ),

                      16.verticalSpace,

                      // --- 2. Use the length of your list ---
                      ListView.separated(
                        itemCount: benefitsResources.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return 12.verticalSpace;
                        },
                        itemBuilder: (context, index) {
                          // Get the specific model for this row
                          final videoData = benefitsResources[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoPlayerScreen(videoData: videoData),
                                ),
                              );
                            },
                            child: BenefitCard(
                              title: videoData.title,
                              icon: IconManager.playIcon,
                              shareOnTap: () async {
                                await ShareUtils.shareContent(
                                  title: videoData.title,
                                  url: videoData.youtubeUrl,
                                );
                              },
                            ),
                          );
                        },
                      ),

                      24.verticalSpace,

                      Text(
                        'Scientific Articles',
                        style: getSemiBold600Style16(
                          color: ColorManager.textPrimary,
                        ),
                      ),

                      16.verticalSpace,
                      ListView.separated(
                        itemCount: articlesResources.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return 12.verticalSpace;
                        },
                        itemBuilder: (context, index) {
                          final articleData = articlesResources[index];
                          return GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(articleData.articleUrl));
                            },
                            child: BenefitCard(
                              title: articleData.title,
                              icon: IconManager.epDocument,
                              shareOnTap: () async {
                                await ShareUtils.shareContent(
                                  title: articleData.title,
                                  url: articleData.articleUrl,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      24.verticalSpace,
                      PrimaryButton(
                        title: 'Start Breathing',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.breathingPractiveScreen,
                          );
                        },
                      ),
                      40.verticalSpace,
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
