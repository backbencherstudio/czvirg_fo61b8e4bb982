import 'package:flutter_riverpod/legacy.dart';

/// Provider for managing bottom navigation state
final bottomNavIndexProvider = StateNotifierProvider<BottomNavViewModel, int>(
      (ref) => BottomNavViewModel(),
);

class BottomNavViewModel extends StateNotifier<int> {
  BottomNavViewModel() : super(0);
  void onTabIndex(int index) {
    state = index;
  }
}