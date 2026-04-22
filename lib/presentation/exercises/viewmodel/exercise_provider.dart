import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/constansts/icon_manager.dart';
import '../model/exercise_model.dart';

// --- Dummy Data Repository ---
final List<ExerciseModel> defaultExercises = [
  ExerciseModel(
    id: '1',
    name: '4-7-8',
    steps: [
      ExerciseStep(title: 'Inhale', durationSec: 4, icon: IconManager.arrowUp),
      ExerciseStep(title: 'Hold', durationSec: 7, icon: IconManager.arrowRight),
      ExerciseStep(
        title: 'Exhale',
        durationSec: 8,
        icon: IconManager.arrowDown,
      ),
    ],
  ),
  ExerciseModel(
    id: '2',
    name: 'Box',
    steps: [
      ExerciseStep(title: 'Inhale', durationSec: 4, icon: IconManager.arrowUp),
      ExerciseStep(title: 'Hold', durationSec: 4, icon: IconManager.arrowRight),
      ExerciseStep(
        title: 'Exhale',
        durationSec: 4,
        icon: IconManager.arrowDown,
      ),
      ExerciseStep(title: 'Hold', durationSec: 4, icon: IconManager.arrowRight),
    ],
  ),
  ExerciseModel(
    id: '3',
    name: 'Ujjayi',
    steps: [
      ExerciseStep(title: 'Inhale', durationSec: 4, icon: IconManager.arrowUp),
      ExerciseStep(
        title: 'Exhale',
        durationSec: 4,
        icon: IconManager.arrowDown,
      ),
    ],
  ),

  ExerciseModel(
    id: '4',
    name: 'Rectangle',
    steps: [
      ExerciseStep(title: 'Inhale', durationSec: 4, icon: IconManager.arrowUp),
      ExerciseStep(
        title: 'Exhale',
        durationSec: 4,
        icon: IconManager.arrowDown,
      ),
    ],
  ),

  ExerciseModel(
    id: '5',
    name: '1:2 Ratio',
    steps: [
      ExerciseStep(title: 'Inhale', durationSec: 4, icon: IconManager.arrowUp),
      ExerciseStep(
        title: 'Exhale',
        durationSec: 4,
        icon: IconManager.arrowDown,
      ),
    ],
  ),
];

// --- Provider ---
class ExerciseNotifier extends StateNotifier<ExerciseModel> {
  ExerciseNotifier() : super(defaultExercises.first);

  void setExercise(ExerciseModel exercise) {
    state = exercise;
  }

  void updateRepeatCount(int newCount) {
    state = state.copyWith(repeatCount: newCount);
  }
}

final exerciseProvider = StateNotifierProvider<ExerciseNotifier, ExerciseModel>(
  (ref) {
    return ExerciseNotifier();
  },
);

final availableExercisesProvider = Provider<List<ExerciseModel>>((ref) {
  return defaultExercises;
});
