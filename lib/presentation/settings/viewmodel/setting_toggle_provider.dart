import 'package:czvirg_fo61b8e4bb982/presentation/settings/model/setting_model.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../core/constansts/icon_manager.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, List<SettingModel>>(
  (ref) => SettingsNotifier(),
);

class SettingsNotifier extends StateNotifier<List<SettingModel>> {
  SettingsNotifier()
      : super([
          SettingModel(
            title: "Dr. Weil's 4-7-8 Breathing",
            icon: IconManager.speaker,
            isSelected: true,
          ),
          SettingModel(
            title: "Dr. Weil's 4-7-8 Breathing",
            icon: IconManager.biPhone,
            isSelected: true,
          ),
          SettingModel(
            title: "Dr. Weil's 4-7-8 Breathing",
            icon: IconManager.mic,
            isSelected: true,
          ),
        ]);

  void toggle(int index, bool value) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isSelected: value)
        else
          state[i],
    ];
  }
}