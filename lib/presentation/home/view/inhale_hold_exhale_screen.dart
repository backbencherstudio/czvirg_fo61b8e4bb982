import 'dart:async';
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
import 'package:just_audio/just_audio.dart';
import 'package:flutter/services.dart';



class InhaleHoldExhaleScreen extends ConsumerStatefulWidget {
  const InhaleHoldExhaleScreen({super.key});

  @override
  ConsumerState<InhaleHoldExhaleScreen> createState() =>
      _InhaleHoldExhaleScreenState();
}

class _InhaleHoldExhaleScreenState extends ConsumerState<InhaleHoldExhaleScreen> {
  Timer? _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isMuted = false;
  bool isVibrationOn = true;

  // Session Settings
  final int totalDurationMs = 60000; // 1 Minute default
  int totalElapsedMs = 0;

  // Breathing Phase Settings (4-7-8 method)
  String currentPhase = 'INHALE';
  int currentPhaseDurationMs = 4000; // Starts with 4 seconds Inhale
  int phaseElapsedMs = 0;
  int cyclesLeft = 3; // roughly 60 seconds / 19s per cycle

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startSession();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startSession() {
    ref.read(manageStageProvider.notifier).state = 'active';
    _timer?.cancel();
    
    // Play initial sound
    _playSoundAndVibrate(currentPhase);
    
    // Ticking every 50ms for buttery smooth circular and linear animations
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final stage = ref.read(manageStageProvider);
      
      // If paused or ended, don't progress the time
      if (stage != 'active') return;

      setState(() {
        totalElapsedMs += 50;
        phaseElapsedMs += 50;

        // Check Phase Transition
        if (phaseElapsedMs >= currentPhaseDurationMs) {
          _nextPhase();
        }

        // Check Session End
        if (totalElapsedMs >= totalDurationMs) {
          _timer?.cancel();
          ref.read(manageStageProvider.notifier).state = 'end';
          _playSoundAndVibrate('FINISHED');
        }
      });
    });
  }

  void _nextPhase() {
    phaseElapsedMs = 0;
    if (currentPhase == 'INHALE') {
      currentPhase = 'HOLD';
      currentPhaseDurationMs = 7000; // 7 seconds
    } else if (currentPhase == 'HOLD') {
      currentPhase = 'EXHALE';
      currentPhaseDurationMs = 8000; // 8 seconds
    } else {
      currentPhase = 'INHALE';
      currentPhaseDurationMs = 4000; // 4 seconds
      if (cyclesLeft > 0) cyclesLeft--;
    }
    _playSoundAndVibrate(currentPhase);
  }

  Future<void> _playSoundAndVibrate(String phase) async {
    if (isVibrationOn) {
      HapticFeedback.vibrate();
    }
    if (!isMuted) {
      try {
        String assetPath = '';
        if (phase == 'INHALE') {
          assetPath = 'assets/audio/Inhale2.m4a';
        } else if (phase == 'HOLD') {
          assetPath = 'assets/audio/Hold 2.m4a';
        } else if (phase == 'EXHALE') {
          assetPath = 'assets/audio/Exhale2.m4a';
        } else if (phase == 'FINISHED') {
          assetPath = 'assets/audio/Finished 2.m4a';
        }
        
        if (assetPath.isNotEmpty) {
          await _audioPlayer.setAsset(assetPath);
          _audioPlayer.play();
        }
      } catch (e) {
        debugPrint('Error playing audio: $e');
      }
    }
  }

  void _resetSession() {
    setState(() {
      totalElapsedMs = 0;
      phaseElapsedMs = 0;
      currentPhase = 'INHALE';
      currentPhaseDurationMs = 4000;
      cyclesLeft = 3;
    });
    _startSession();
  }

  // --- UI Calculators ---

  String get _formattedTime {
    int remainingSecs = ((totalDurationMs - totalElapsedMs) / 1000).ceil();
    int m = remainingSecs ~/ 60;
    int s = remainingSecs % 60;
    return '$m : ${s.toString().padLeft(2, '0')}';
  }

  double get _circularPercent {
    double rawPercent = phaseElapsedMs / currentPhaseDurationMs;
    if (currentPhase == 'INHALE') {
      return rawPercent.clamp(0.0, 1.0); // Fills up
    } else if (currentPhase == 'HOLD') {
      return 1.0; // Stays full
    } else if (currentPhase == 'EXHALE') {
      return (1.0 - rawPercent).clamp(0.0, 1.0); // Drains out
    }
    return 0.0;
  }

  double get _linearPercent {
    return (totalElapsedMs / totalDurationMs).clamp(0.0, 1.0);
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMuted = !isMuted;
                      });
                      if (isMuted) {
                        _audioPlayer.stop();
                      }
                    },
                    child: AnimatedOpacity(
                      opacity: isMuted ? 0.4 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        IconManager.speaker,
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
                  ),
                  Text(
                    _formattedTime, // Dynamic Time
                    style: getMedium500Style16(color: ColorManager.primary),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVibrationOn = !isVibrationOn;
                      });
                    },
                    child: AnimatedOpacity(
                      opacity: isVibrationOn ? 1.0 : 0.4,
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        IconManager.biPhone,
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
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
                    percent: _circularPercent, // Dynamic Circle Progress
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: ColorManager.primary.withValues(
                      alpha: 0.2,
                    ),
                    progressColor: ColorManager.primary,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentPhase, // Dynamic Phase Text
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
                              percent: _linearPercent, // Dynamic Linear Progress
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
                          '$cyclesLeft cycles left', // Dynamic Cycles
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
                    _audioPlayer.stop();
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
                          // Resumes timer naturally
                          ref.read(manageStageProvider.notifier).state = 'active';
                          _playSoundAndVibrate(currentPhase);
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
                              value: '1:00 min', // Hardcoded to match 60s
                              iconPath: IconManager.time,
                            ),
                            8.verticalSpace,
                            SessionSummary(
                              title: 'Cycles',
                              value: '3', // Based on our calculation
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
                          _resetSession(); // Resets all timers and restarts
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
        const Spacer(),
        Text(
          value,
          style: getSemiBold600Style16(color: ColorManager.textPrimary),
        ),
      ],
    );
  }
}