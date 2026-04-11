import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constansts/color_manger.dart';
import '../viewmodel/exercise_provider.dart';
import 'widgets/exercise_selector_dialog.dart';
import 'widgets/exercise_step_card.dart';

class ExercisesScreen extends ConsumerStatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ConsumerState<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends ConsumerState<ExercisesScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    // Using a suitable Youtube video for '4-7-8 Breathing'
    final videoId =
        YoutubePlayer.convertUrlToId(
          'https://youtu.be/acUZdGd_3Dg?si=Hqs8bDpNvHDLy3B4',
        ) ??
        'acUZdGd_3Dg';
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        hideControls: true,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    if (minutes > 0) {
      return '$minutes min, $seconds sec';
    }
    return '$seconds sec';
  }

  @override
  Widget build(BuildContext context) {
    final activeExercise = ref.watch(exerciseProvider);

    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exercises',
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
                      // --- VIDEO PLAYLIST EMBED ---
                      GestureDetector(
                        onTap: () {
                          launchUrl(
                            Uri.parse(
                              'https://www.youtube.com/watch?v=acUZdGd_3Dg&list=PL5111000000000000&index=1',
                            ),
                          );
                        },
                        child: Container(
                          height: 190.h,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.white12, width: 1),
                          ),
                          child: AbsorbPointer(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: 1600,
                                height: 900,
                                child: YoutubePlayer(
                                  controller: _youtubeController,
                                  showVideoProgressIndicator: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      32.verticalSpace,
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Selected Exercise',
                              style: GoogleFonts.merriweather(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            8.verticalSpace,

                            // --- EXERCISE DROPDOWN TRIGGER ---
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.black54,
                                  builder: (context) =>
                                      const ExerciseSelectorDialog(),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    activeExercise.name,
                                    style: GoogleFonts.inter(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF4AC2B4),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  SvgPicture.asset(IconManager.unfoldMore),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      32.verticalSpace,

                      // --- DYNAMIC STEPS LIST ---
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: activeExercise.steps.length,
                        separatorBuilder: (context, index) => 12.verticalSpace,
                        itemBuilder: (context, index) {
                          final step = activeExercise.steps[index];
                          return ExerciseStepCard(
                            title: step.title,
                            durationSec: step.durationSec,
                            icon: step.icon,
                          );
                        },
                      ),

                      16.verticalSpace,

                      // --- REPEAT SLIDER WIDGET ---
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF131313),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.transparent),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      IconManager.repeat,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      'Repeat Exercise',
                                      style: getMedium500Style16(
                                        color: ColorManager.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${activeExercise.repeatCount} Times',
                                  style: getSemiBold600Style16(
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            SliderTheme(
                              data: SliderThemeData(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.white24,
                                thumbColor: Colors.white,
                                trackHeight: 6.h, // Thinner line
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 6.r,
                                ),
                                overlayShape: RoundSliderOverlayShape(
                                  overlayRadius: 14.r,
                                ),
                              ),
                              child: Slider(
                                value: activeExercise.repeatCount.toDouble(),
                                min: 1,
                                max: 20,
                                onChanged: (val) {
                                  ref
                                      .read(exerciseProvider.notifier)
                                      .updateRepeatCount(val.toInt());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      32.verticalSpace,

                      // --- TOTAL DURATION ---
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Exercise Length',
                              style: getSemiBold600Style20(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                            8.verticalSpace,
                            Text(
                              _formatDuration(
                                activeExercise.totalDurationSeconds,
                              ),
                              style: getRegular400Style18(
                                color: ColorManager.primary,
                              ),
                            ),
                          ],
                        ),
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
