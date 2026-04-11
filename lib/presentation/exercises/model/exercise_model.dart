class ExerciseStep {
  final String title;
  final int durationSec;
  final String icon;

  ExerciseStep({
    required this.title,
    required this.durationSec,
    required this.icon,
  });
}

class ExerciseModel {
  final String id;
  final String name;
  final List<ExerciseStep> steps;
  final int repeatCount;
  final bool isCustom;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.steps,
    this.repeatCount = 5,
    this.isCustom = false,
  });

  ExerciseModel copyWith({
    String? id,
    String? name,
    List<ExerciseStep>? steps,
    int? repeatCount,
    bool? isCustom,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      steps: steps ?? this.steps,
      repeatCount: repeatCount ?? this.repeatCount,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  // Helper to calculate total time in seconds
  int get totalDurationSeconds {
    int singleCycle = steps.fold(0, (sum, step) => sum + step.durationSec);
    return singleCycle * repeatCount;
  }
}