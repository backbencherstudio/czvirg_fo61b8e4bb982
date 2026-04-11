import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/presentation/custom_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final List<VideoResourceModel> videoResources = [
    VideoResourceModel(
      title: 'Box Breathing with Mark Divine',
      subtitle: 'Life Optimization Series',
      youtubeUrl: 'https://youtu.be/j-1n3KJR1I8?si=JA4AM-ubeDMMcGcB',
      videoId: 'j-1n3KJR1I8',
      timesWatched: 3,
      lastWatchedDate: 'March 28, 2026',
    ),
    VideoResourceModel(
      title: 'Navy SEAL Breathing Technique',
      subtitle: 'Breathing Techniques',
      youtubeUrl: 'https://youtube.com/shorts/FpQMfI56Cj4?si=uOtfdd8NxPqH4sZB',
      videoId: 'FpQMfI56Cj4',
      timesWatched: 1,
      lastWatchedDate: 'April 2, 2026',
    ),
    VideoResourceModel(
      title: 'How to Box Breathing for Calm',
      subtitle: 'Mindfulness Basics',
      youtubeUrl: 'https://youtu.be/-7-CAFhJn78?si=u0XIZW_6Nc5zbEr8',
      videoId: '-7-CAFhJn78',
      timesWatched: 0,
      lastWatchedDate: 'Not watched yet',
    ),
  ];

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
                  'Benefits',
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

                // --- 2. Use the length of your list ---
                ListView.separated(
                  itemCount: videoResources.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return 12.verticalSpace;
                  },
                  itemBuilder: (context, index) {
                    // Get the specific model for this row
                    final videoData = videoResources[index];

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
                      shareOnTap: () async {
                        await ShareUtils.shareContent(
                          title: "Box Breathing with Mark Divine",
                          url:
                              "https://youtube.com/shorts/6-mnpdlb0N8?si=uEeW6UNLKTWGtFIp",
                        );
                      },
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
