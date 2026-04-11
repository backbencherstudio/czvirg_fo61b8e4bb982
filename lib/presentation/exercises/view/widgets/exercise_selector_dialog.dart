import 'package:czvirg_fo61b8e4bb982/core/constansts/color_manger.dart';
import 'package:czvirg_fo61b8e4bb982/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../viewmodel/exercise_provider.dart';

class ExerciseSelectorDialog extends ConsumerWidget {
  const ExerciseSelectorDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableExercises = ref.watch(availableExercisesProvider);
    final activeExercise = ref.watch(exerciseProvider);

    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: const Color(0xFF101010),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4AC2B4).withValues(alpha: 0.15),
              blurRadius: 40.r,
              spreadRadius: 5.r,
            ),
          ],
          border: Border.all(color: Colors.white12, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clara Vida Exercise',
              style: getMedium500Style16(color: ColorManager.textSecondary),
            ),
            16.verticalSpace,
            ...availableExercises.map((exercise) {
              final isSelected = exercise.id == activeExercise.id;
              return InkWell(
                onTap: () {
                  ref.read(exerciseProvider.notifier).setExercise(exercise);
                  Navigator.pop(context);
                },
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.check_box_rounded
                            : Icons.crop_square_rounded,
                        color: isSelected
                            ? const Color(0xFF4AC2B4)
                            : Colors.white30,
                        size: 22.r,
                      ),
                      12.horizontalSpace,
                      Text(
                        exercise.name,
                        style: getMedium500Style16(
                          color: isSelected
                              ? ColorManager.primary
                              : ColorManager.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            16.verticalSpace,
            Divider(color: Colors.white12, height: 1),
            16.verticalSpace,
            Text(
              'Custom Exercise',
              style: getMedium500Style16(color: ColorManager.textSecondary),
            ),
            16.verticalSpace,
            // Example custom item
            Row(
              children: [
                Icon(
                  Icons.crop_square_rounded,
                  color: Colors.white30,
                  size: 22.r,
                ),
                12.horizontalSpace,
                Text(
                  'Custom Exercise 1',
                  style: getMedium500Style16(color: ColorManager.textPrimary),
                ),
              ],
            ),
            16.verticalSpace,
            Row(
              children: [
                Container(
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(Icons.add, color: Colors.black, size: 16.r),
                ),
                12.horizontalSpace,
                Text(
                  'New Exercise',
                  style: getMedium500Style16(color: ColorManager.textPrimary),
                ),
              ],
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }
}
