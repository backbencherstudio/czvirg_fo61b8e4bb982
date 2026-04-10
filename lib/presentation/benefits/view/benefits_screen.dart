import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/presentation/custom_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../core/utils/share_utils.dart';
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
                      icon: IconManager.playIcon,
                      shareOnTap: () async {
                        await ShareUtils.shareContent(
                          title: "Box Breathing with Mark Divine",
                          url:
                              "https://youtube.com/shorts/sxmTTS4qros?si=vRp5zfLqk4I2RZvJ",
                        );
                      },
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


    // showModalBottomSheet(
    //                       backgroundColor: Colors.transparent,
    //                       context: context,
    //                       builder: (context) {
    //                         return Container(
    //                           padding: EdgeInsets.symmetric(horizontal: 20.w),
    //                           decoration: BoxDecoration(
    //                             color: ColorManager.blackColor,
    //                             border: Border(
    //                               top: BorderSide(
    //                                 color: ColorManager.borderColor3,
    //                               ),
    //                             ),
    //                             borderRadius: BorderRadius.only(
    //                               topLeft: Radius.circular(24.r),
    //                               topRight: Radius.circular(24.r),
    //                             ),
    //                           ),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             mainAxisSize: MainAxisSize.min,
    //                             children: [
    //                               20.verticalSpace,
    //                               Center(
    //                                 child: Container(
    //                                   height: 4.h,
    //                                   width: 74.w,
    //                                   decoration: BoxDecoration(
    //                                     color: ColorManager.borderColor,
    //                                     borderRadius: BorderRadius.circular(
    //                                       2.r,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                               24.verticalSpace,
    //                               Text(
    //                                 'Share',
    //                                 style: getBold700Style16(
    //                                   color: ColorManager.textPrimary,
    //                                 ),
    //                               ),
    //                               4.verticalSpace,
    //                               Text(
    //                                 '1st Video - Life Optimization Series',
    //                                 style: getRegular400Style14(
    //                                   color: ColorManager.textSecondary,
    //                                 ),
    //                               ),
    //                               24.verticalSpace,
    //                               Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   Expanded(
    //                                     child: ShareItem(
    //                                       title: 'Messages',
    //                                       icon: IconManager.messageIcon,
    //                                       onTap: () {},
    //                                     ),
    //                                   ),
    //                                   8.horizontalSpace,
    //                                   Expanded(
    //                                     child: ShareItem(
    //                                       title: 'Email',
    //                                       icon: IconManager.emailIcon,
    //                                       onTap: () {},
    //                                     ),
    //                                   ),
    //                                   8.horizontalSpace,
    //                                   Expanded(
    //                                     child: ShareItem(
    //                                       title: 'Copy Link',
    //                                       icon: IconManager.copyLinkIcon,
    //                                       onTap: () {},
    //                                     ),
    //                                   ),
    //                                   8.horizontalSpace,
    //                                   Expanded(
    //                                     child: ShareItem(
    //                                       title: 'More',
    //                                       icon: IconManager.moreIcon,
    //                                       onTap: () {},
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               24.verticalSpace,
    //                               PrimaryButton(
    //                                 title: 'Cancel',
    //                                 containerColor: ColorManager
    //                                     .backgroundSurface3
    //                                     .withValues(alpha: 0.15),
    //                                 border: Border.all(
    //                                   color: ColorManager.backgroundSurface3
    //                                       .withValues(alpha: 0.24),
    //                                 ),
    //                                 textStyle: getSemiBold600Style16(
    //                                   color: ColorManager.backgroundSurface3,
    //                                 ),
    //                                 onTap: () {
    //                                   Navigator.pop(context);
    //                                 },
    //                               ),
    //                               40.verticalSpace,
    //                             ],
    //                           ),
    //                         );
    //                       },
    //                     );

// class ShareItem extends StatelessWidget {
//   const ShareItem({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.onTap,
//   });
//   final String icon;
//   final String title;
//   final VoidCallback onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(8.r),
//         decoration: BoxDecoration(
//           color: ColorManager.backgroundSurface2,
//           border: Border.all(color: ColorManager.borderColor2),
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(icon, height: 22.h, width: 22.w),
//             8.verticalSpace,
//             Text(
//               title,
//               style: getRegular400Style14(color: ColorManager.textPrimary),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
