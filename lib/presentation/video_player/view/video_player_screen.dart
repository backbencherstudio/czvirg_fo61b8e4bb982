import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../core/constansts/color_manger.dart';
import '../../benefits/model/benefit_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoResourceModel videoData;

  const VideoPlayerScreen({super.key, required this.videoData});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = widget.videoData.videoId;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true, // Hide default controls to use custom UI
      ),
    );

    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final position = _controller.value.position;
    final duration = _controller.metadata.duration;
    final isReady = _controller.value.isReady;

    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 20.verticalSpace,

                // --- BACK BUTTON ---
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: ColorManager.whiteColor,
                    size: 24.r,
                  ),
                ),
                16.verticalSpace,

                // --- VIDEO PLAYER AREA ---
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.expand(
                        child: IgnorePointer(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: 1600,
                              height: 900,
                              child: YoutubePlayer(
                                controller: _controller,
                                showVideoProgressIndicator: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (!_controller.value.isPlaying)
                        Container(color: Colors.black.withValues(alpha: 0.3)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: AnimatedOpacity(
                          opacity: _controller.value.isPlaying ? 0.0 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            height: 56.r,
                            width: 56.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFBBE5F1),
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black,
                              size: 36.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,

                // --- PROGRESS BAR ---
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ProgressBar(
                      controller: _controller,
                      isExpanded: false,
                      colors: ProgressBarColors(
                        playedColor: const Color(0xFF539DB5),
                        backgroundColor: const Color(0xFF2C3136),
                        bufferedColor: Colors.grey.withValues(alpha: 0.3),
                        handleColor: const Color(0xFF539DB5),
                      ),
                    ),
                  ),
                ),
                8.verticalSpace,

                // --- TIMERS ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isReady ? _formatDuration(position) : "0:00",
                      style: getRegular400Style14(
                        color: ColorManager.whiteColor,
                      ),
                    ),
                    Text(
                      isReady ? _formatDuration(duration) : "5:00",
                      style: getRegular400Style14(
                        color: ColorManager.whiteColor,
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,

                // --- TITLE & TAG DYNAMICALLY LOADED ---
                Text(
                  widget.videoData.title, // <--- Load title dynamically
                  style: getBold700Style20(color: ColorManager.whiteColor),
                ),
                12.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.borderColor),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    widget.videoData.subtitle, // <--- Load subtitle dynamically
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
                24.verticalSpace,

                // --- STATS DYNAMICALLY LOADED ---
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        topText: widget.videoData.timesWatched
                            .toString(), // <--- Times Watched
                        bottomText: 'Times Watched',
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: _buildStatCard(
                        topText: widget
                            .videoData
                            .lastWatchedDate, // <--- Last Watched Date
                        bottomText: 'Times Watched',
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,

                Divider(
                  color: ColorManager.borderColor2,
                  thickness: 1,
                  height: 1,
                ),
                24.verticalSpace,

                // --- YOUTUBE BUTTON DYNAMICALLY LOADED ---
                GestureDetector(
                  onTap: () async {
                    // <--- Launch the specific video URL
                    final Uri url = Uri.parse(widget.videoData.youtubeUrl);
                    if (!await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {
                      debugPrint('Could not launch $url');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: ColorManager.backgroundSurface3.withValues(
                        alpha: 0.13,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: ColorManager.backgroundSurface3.withValues(
                          alpha: 0.24,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          color: ColorManager.backgroundSurface3,
                          size: 20.r,
                        ),
                        8.horizontalSpace,
                        Text(
                          'Open in Youtube',
                          style: getSemiBold600Style16(
                            color: ColorManager.backgroundSurface3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({required String topText, required String bottomText}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface2,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorManager.borderColor),
      ),
      child: Column(
        children: [
          Text(
            topText,
            style: getMedium500Style16(color: ColorManager.primary),
            textAlign: TextAlign.center,
          ),
          6.verticalSpace,
          Text(
            bottomText,
            style: getRegular400Style12(color: ColorManager.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
