class ExamTrial {
  late String name;
  late double score;
  late String completedAt;

  ExamTrial({
    required this.name,
    required this.score,
    required this.completedAt,
  });

  ExamTrial.fromJson(Map<String, dynamic> json) {
    score = json['score'] ?? 0.0;
    name = json['unit']['name'] ?? "";
    completedAt = json['completedAt'] ?? "";
  }
}

class ExamTrialsResponseModel {
  late List<ExamTrial> trials;

  ExamTrialsResponseModel({
    required this.trials,
  });

  ExamTrialsResponseModel.fromJson(Map<String, dynamic> json) {
    var examTrials = json['examTrials'] as List;
    trials = examTrials.map((e) => ExamTrial.fromJson(e)).toList();
  }
}
