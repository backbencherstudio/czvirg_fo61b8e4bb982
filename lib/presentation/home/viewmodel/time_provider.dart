// viewmodel/breath_timer_provider.dart

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'manage_stage_provider.dart';

class BreathTimerNotifier extends StateNotifier<int> {
  BreathTimerNotifier(this._ref) : super(59); // total seconds

  final Ref _ref;
  Timer? _timer;

  void start() {
    _timer?.cancel();
    state = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state > 0) {
        state = state - 1;
      } else {
        _timer?.cancel();
        _ref.read(manageStageProvider.notifier).state = 'end';
      }
    });
  }

  void pause() => _timer?.cancel();

  void resume() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state > 0) {
        state = state - 1;
      } else {
        _timer?.cancel();
        _ref.read(manageStageProvider.notifier).state = 'end';
      }
    });
  }

  void reset() {
    _timer?.cancel();
    state = 59;
  }

  String get formatted {
    final m = state ~/ 60;
    final s = state % 60;
    return '$m : ${s.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final breathTimerProvider =
    StateNotifierProvider<BreathTimerNotifier, int>((ref) {
  return BreathTimerNotifier(ref);
});