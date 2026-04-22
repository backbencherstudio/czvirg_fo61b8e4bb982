import 'package:flutter_riverpod/flutter_riverpod.dart';

final breathPracticeSelectionProvider = NotifierProvider<BreathPracticeSelectionNotifier, int>(
  BreathPracticeSelectionNotifier.new,
);

class BreathPracticeSelectionNotifier extends Notifier<int> {
  @override
  int build() {
    return -1;
  }

  void selectIndex(int index) {
    state = index;
  }
}
