class UnitResponseModel {
  late int id;
  late String name;
  late String description;
  late String imageUrl;
  late String? exam;
  late int completedLessons;
  late int totalLessons;

  UnitResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.exam,
    required this.completedLessons,
    required this.totalLessons,
  });

  UnitResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image'];
    exam = json['exam'];
    completedLessons = json['completedLessons'];
    totalLessons = json['totalLessons'];
  }
}