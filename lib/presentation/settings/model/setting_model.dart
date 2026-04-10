class SettingModel {
  final String title;
  final String icon;
  final bool isSelected;

  SettingModel({
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  SettingModel copyWith({String? title, String? icon, bool? isSelected}) {
    return SettingModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
