import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/image_manager.dart';
import '../../../core/resource/style_manager.dart';
import '../../../core/route/route_name.dart';
import '../../../core/utils/share_utils.dart';
import '../../benefits/model/benefit_model.dart';
import 'widgets/video_series.dart';

class LifeEducationScreen extends StatefulWidget {
  const LifeEducationScreen({super.key});

  @override
  State<LifeEducationScreen> createState() => _LifeEducationScreenState();
}

class _LifeEducationScreenState extends State<LifeEducationScreen> {
  late final List<VideoResourceModel> videoResources;

  @override
  void initState() {
    super.initState();
    videoResources = List.generate(
      7,
      (index) => VideoResourceModel(
        title: 'Life Optimization Part ${index + 1}',
        subtitle: 'Life Optimization Series',
        youtubeUrl: 'https://youtu.be/-7-CAFhJn78?si=-295kRl0_r8D2twb',
        videoId: '-7-CAFhJn78',
        timesWatched: index == 0 ? 1 : 0,
        lastWatchedDate: index == 0 ? 'March 28, 2026' : 'Unwatched',
      ),
    );
  }

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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: ColorManager.whiteColor,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.verticalSpace,
                      Center(
                        child: Image.asset(
                          ImageManager.homeImage,
                          height: 153.h,
                          width: double.infinity,
                        ),
                      ),
                      24.verticalSpace,
                      Center(
                        child: Text(
                          'Life Optimization Series',
                          style: getSemiBold600Style20(
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Center(
                        child: Text(
                          '${videoResources.length} Videos',
                          style: getRegular400Style14(
                            color: ColorManager.textSecondary,
                          ),
                        ),
                      ),
                      16.verticalSpace,
                      Divider(color: ColorManager.borderColor2, thickness: 2.w),
                      24.verticalSpace,

                      ListView.separated(
                        itemCount: videoResources.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return 12.verticalSpace;
                        },
                        itemBuilder: (context, index) {
                          final videoData = videoResources[index];
                          return VideoSeries(
                            index: index + 1,
                            video: videoData,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.videoPlayerScreen,
                                arguments: {'videoData': videoData},
                              );
                            },
                            onShareTap: () async {
                              await ShareUtils.shareContent(
                                title: videoData.title,
                                url: videoData.youtubeUrl,
                              );
                            },
                          );
                        },
                      ),
                      24.verticalSpace,
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
