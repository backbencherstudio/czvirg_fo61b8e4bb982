import 'package:czvirg_fo61b8e4bb982/core/constansts/icon_manager.dart';
import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart'; // Make sure to import fl_chart
import '../../../core/constansts/color_manger.dart';
import 'widgets/progress_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
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
                'Your Progress',
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
                      Row(
                        children: [
                          Expanded(
                            child: ProgressCard(
                              icon: IconManager.heartRate,
                              value: '2',
                              label: 'minutes',
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: ProgressCard(
                              icon: IconManager.time,
                              value: '4',
                              label: 'minutes',
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: ProgressCard(
                              icon: IconManager.flashOutline,
                              value: '6',
                              label: 'minutes',
                            ),
                          ),
                        ],
                      ),
                      24.verticalSpace,

                      // Updated Recent Sessions Container with fl_chart
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundSurface2,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: ColorManager.borderColor2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recent Sessions',
                              style: getSemiBold600Style16(
                                color: ColorManager.textPrimary,
                              ),
                            ),
                            24.verticalSpace,
                            SizedBox(
                              height: 180.h,
                              child: Stack(
                                children: [
                                  // Bottom Layer: Bar Chart (Handles grid, bars, and X-axis titles)
                                  BarChart(
                                    BarChartData(
                                      maxY: 10,
                                      minY: 0,
                                      gridData: FlGridData(
                                        show: true,
                                        drawVerticalLine: true,
                                        getDrawingHorizontalLine: (value) =>
                                            FlLine(
                                              color: Colors.white.withValues(
                                                alpha: 0.05,
                                              ),
                                              strokeWidth: 1,
                                            ),
                                        getDrawingVerticalLine: (value) =>
                                            FlLine(
                                              color: Colors.white.withValues(
                                                alpha: 0.05,
                                              ),
                                              strokeWidth: 1,
                                            ),
                                      ),
                                      borderData: FlBorderData(show: false),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        topTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        rightTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        leftTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: _bottomTitles,
                                            reservedSize: 30,
                                          ),
                                        ),
                                      ),
                                      barGroups: [
                                        _makeBarData(0, 3.5),
                                        _makeBarData(1, 5.5),
                                        _makeBarData(2, 2.5),
                                        _makeBarData(3, 9.0),
                                        _makeBarData(4, 1.0),
                                        _makeBarData(5, 2.5),
                                        _makeBarData(6, 2.5),
                                      ],
                                    ),
                                  ),
                                  // Top Layer: Line Chart (Dashed trend line)
                                  LineChart(
                                    LineChartData(
                                      maxY: 10,
                                      minY: 0,
                                      minX: 0,
                                      maxX:
                                          6, // Matches the 0-6 index of the BarChart
                                      gridData: const FlGridData(show: false),
                                      titlesData: const FlTitlesData(
                                        show: false,
                                      ),
                                      borderData: FlBorderData(show: false),
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots: const [
                                            FlSpot(0, 2.5),
                                            FlSpot(1, 7.5),
                                            FlSpot(2, 1.0),
                                            FlSpot(3, 3.5),
                                            FlSpot(4, 5.0),
                                            FlSpot(5, 2.5),
                                            FlSpot(6, 6.5),
                                          ],
                                          isCurved: false,
                                          color: Colors.grey.withValues(
                                            alpha: 0.7,
                                          ),
                                          barWidth: 2,
                                          isStrokeCapRound: true,
                                          dashArray: [
                                            5,
                                            5,
                                          ], // Creates the dashed effect
                                          dotData: const FlDotData(show: false),
                                          belowBarData: BarAreaData(
                                            show: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      24.verticalSpace,
                      Text(
                        'Recent Sessions',
                        style: getSemiBold600Style16(
                          color: ColorManager.textPrimary,
                        ),
                      ),
                      24.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundSurface2,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: ColorManager.borderColor2),
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
                                  IconManager.roundAir,
                                  height: 44.h,
                                  width: 44.w,
                                ),
                              ),
                            ),
                            12.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Custom Mode',
                                  style: getSemiBold600Style16(
                                    color: ColorManager.textPrimary,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  "Mar 12 at 9:05 AM",
                                  style: getRegular400Style12(
                                    color: ColorManager.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '1m',
                              style: getSemiBold600Style16(
                                color: ColorManager.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundSurface2,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: ColorManager.borderColor2),
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
                                  IconManager.roundAir,
                                  height: 44.h,
                                  width: 44.w,
                                ),
                              ),
                            ),
                            12.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4 In / 4 Out',
                                  style: getSemiBold600Style16(
                                    color: ColorManager.textPrimary,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  "Mar 11 at 11:41 AM",
                                  style: getRegular400Style12(
                                    color: ColorManager.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '3m',
                              style: getSemiBold600Style16(
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

  // Helper method to create the bar chart rods uniformly
  BarChartGroupData _makeBarData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: ColorManager.primary,
          width: 24.w,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

  // Helper method for the custom X-axis labels
  Widget _bottomTitles(double value, TitleMeta meta) {
    final style = GoogleFonts.armata(
      color: Colors.grey.withValues(alpha: 0.8),
      fontSize: 12.sp,
    );

    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAI';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUN';
        break;
      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      space: 8.h,
      meta: meta,
      child: Text(text, style: style),
    );
  }
}
