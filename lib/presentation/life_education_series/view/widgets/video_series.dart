import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/constansts/icon_manager.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../benefits/model/benefit_model.dart';

class VideoSeries extends StatelessWidget {
  final int index;
  final VideoResourceModel video;
  final VoidCallback onTap;
  final VoidCallback onShareTap;
  final bool isSelected;

  const VideoSeries({
    super.key,
    required this.index,
    required this.video,
    required this.onTap,
    required this.onShareTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.primary.withValues(alpha: 0.13)
              : ColorManager.backgroundSurface2.withValues(alpha: 0.13),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? ColorManager.primary.withValues(alpha: 0.5)
                : ColorManager.borderColor2,
          ),
        ),
        child: Row(
          children: [
            Text(
              '$index',
              style: getMedium500Style16(color: ColorManager.textSecondary),
            ),
            12.horizontalSpace,
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorManager.borderColor3,
                  width: 2.w,
                ),
                color: ColorManager.backgroundSurface2,
              ),
              child: SvgPicture.asset(
                IconManager.play,
                height: 16.h,
                width: 16.w,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: getMedium500Style16(color: ColorManager.whiteColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      Text(
                        '${video.timesWatched}x ${video.lastWatchedDate}',
                        style: getRegular400Style14(
                          color: ColorManager.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (isSelected) ...[
                        4.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'Watched',
                            style: getMedium500Style12(
                              color: ColorManager.primary,
                            ).copyWith(fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            12.horizontalSpace,
            GestureDetector(
              onTap: onShareTap,
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: SvgPicture.asset(
                  IconManager.fluentShare,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
