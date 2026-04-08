import 'package:flutter/material.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../l10n/app_localizations.dart';

class BreathPracticeModel {
  final String title;
  final String time;
  final String subTitle;
  final String image;
  final bool isCustom;
  final bool isSelected;
  final List<String> tags;

  const BreathPracticeModel({
    required this.title,
    required this.time,
    required this.subTitle,
    required this.image,
    this.isCustom = false,
    this.isSelected = false,
    this.tags = const [],
  });

  BreathPracticeModel copyWith({
    String? title,
    String? time,
    String? subTitle,
    String? image,
    bool? isCustom,
    bool? isSelected,
    List<String>? tags,
  }) {
    return BreathPracticeModel(
      title: title ?? this.title,
      time: time ?? this.time,
      subTitle: subTitle ?? this.subTitle,
      image: image ?? this.image,
      isCustom: isCustom ?? this.isCustom,
      isSelected: isSelected ?? this.isSelected,
      tags: tags ?? this.tags,
    );
  }
}

class BreathPracticeData {
  static List<BreathPracticeModel> getPractices(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      BreathPracticeModel(
        title: l10n.fourSevenEightRelaxation,
        time: '4/7/8',
        subTitle: l10n.calmYourNervousSystem,
        image: IconManager.tdesignMoon,
        tags: [l10n.beginner, l10n.balance, l10n.dailyUse],
      ),
      BreathPracticeModel(
        title: l10n.inOut,
        time: '4/4',
        subTitle: l10n.theSimplestAndMostNaturalBreathing,
        image: IconManager.icRoundAir,
        tags: [l10n.beginner, l10n.balance, l10n.dailyUse],
      ),
      BreathPracticeModel(
        title: l10n.boxBreathing,
        time: '4/4/4/4',
        subTitle: l10n.aPowerfulTechniqueUsedByNavySEALs,
        image: IconManager.radixIconsBox,
        tags: [l10n.beginner, l10n.balance, l10n.dailyUse],
      ),
      BreathPracticeModel(
        title: l10n.customMode,
        time: '',
        subTitle: l10n.setYourOwnBreathingPattern,
        image: IconManager.heroiconsAdjustments,
        isCustom: true,
        tags: [],
      ),
    ];
  }
}
