class LessonResponseModel {
  late int id;
  late String name;
  late String content;
  late String video;
  late List<QuestionResponseModel> questions;
  late bool passed;

  LessonResponseModel({
    required this.id,
    required this.name,
    required this.content,
    required this.video,
    required this.questions,
    required this.passed,
  });

  LessonResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    video = json['video'];
    questions = (json['questions'] as List).map((e) => QuestionResponseModel.fromJson(e)).toList();
    passed = json['passed'];
  }
}

class QuestionResponseModel {
  late int id;
  late String type;
  late String text;
  late List<OptionResponseModel> options;
  late OptionResponseModel correctAnswer;
  OptionResponseModel? selectedOption;
  bool isAnswered = false;

  QuestionResponseModel({
    required this.id,
    required this.type,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });

  QuestionResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    text = json['text'];
    options = (json['options'] as List).map((e) => OptionResponseModel.fromJson(e)).toList();
    // TODO: remove the null check right hand side
    correctAnswer = OptionResponseModel.fromJson(json['correctAnswer'] ?? {"id": 0, "text": ""});
  }
}

class OptionResponseModel {
  late int id;
  late String text;
  bool? isSelected;

  OptionResponseModel({
    required this.id,
    required this.text,
    this.isSelected,
  });

  OptionResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }
}