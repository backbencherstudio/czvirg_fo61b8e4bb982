import 'package:flutter_riverpod/flutter_riverpod.dart';

final roleSelectionProvider = NotifierProvider<RoleSelectionNotifier, String>(
  RoleSelectionNotifier.new,
);

class RoleSelectionNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void selectRole(String role) {
    state = state == role ? "" : role;
  }
}