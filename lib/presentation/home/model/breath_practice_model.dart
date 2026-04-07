import '../../../core/constansts/icon_manager.dart';

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
  static List<BreathPracticeModel> practices = [
    BreathPracticeModel(
      title: '4–7–8 Relaxation',
      time: '4/7/8',
      subTitle: 'Calm your nervous system',
      image: IconManager.tdesignMoon,
      tags: ['Beginner', 'Balance', 'Daily Use'],
    ),
    BreathPracticeModel(
      title: '4 In | 4 Out',
      time: '4/4',
      subTitle: 'The simplest and most natural breathing...',
      image: IconManager.icRoundAir,
      tags: ['Beginner', 'Balance', 'Daily Use'],
    ),
    BreathPracticeModel(
      title: 'Box Breathing',
      time: '4/4/4/4',
      subTitle: 'A powerful technique used by Navy SEALs',
      image: IconManager.radixIconsBox,
      tags: ['Beginner', 'Balance', 'Daily Use'],
    ),
    BreathPracticeModel(
      title: 'Custom Mode',
      time: '',
      subTitle: 'Set your own breathing pattern',
      image: IconManager.heroiconsAdjustments,
      isCustom: true,
      tags: [],
    ),
  ];
}
