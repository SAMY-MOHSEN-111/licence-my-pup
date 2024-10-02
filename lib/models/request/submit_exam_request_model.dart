class SubmitExamRequestModel {
  List<Answer> answers;

  SubmitExamRequestModel({
    this.answers = const <Answer>[],
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answers'] = answers.map((e) => e.toJson()).toList();
    return data;
  }
}

class Answer {
  int questionId;
  int optionId;

  Answer({
    this.questionId = 0,
    this.optionId = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['optionId'] = optionId;
    return data;
  }
}
