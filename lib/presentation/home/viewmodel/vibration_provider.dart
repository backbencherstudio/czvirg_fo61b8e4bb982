import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class VibrationNotifier extends Notifier<bool> {
  @override
  bool build() {
    return true; // Default is vibration on
  }

  void toggleVibration() {
    state = !state;
  }

  Future<void> vibratePhase(String phase) async {
    if (!state) return;

    final hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      if (phase == 'INHALE') {
        Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
      } else if (phase == 'HOLD') {
        Vibration.vibrate(preset: VibrationPreset.softPulse);
      } else if (phase == 'EXHALE') {
        Vibration.vibrate(preset: VibrationPreset.doubleBuzz);
      } else if (phase == 'FINISHED') {
        Vibration.vibrate(preset: VibrationPreset.dramaticNotification);
      } else {
        Vibration.vibrate();
      }
    }
  }

  void cancelVibration() {
    Vibration.cancel();
  }
}

final vibrationProvider = NotifierProvider<VibrationNotifier, bool>(() {
  return VibrationNotifier();
});
