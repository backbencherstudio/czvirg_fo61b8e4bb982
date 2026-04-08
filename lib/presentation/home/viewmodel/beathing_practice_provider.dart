import 'package:flutter_riverpod/flutter_riverpod.dart';

final beathingPracticeProvider = NotifierProvider<BeathingPracticeNotifier, String>(
  BeathingPracticeNotifier.new,
);

class BeathingPracticeNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void selectRole(String role) {
    state = state == role ? "" : role;
  }
}